import SpriteKit

final class PresentationScene: SKScene {
    private let stateMachine: StateMachine
    private let subtitleLabel = SKLabelNode()
    private let backgroundImage = SKSpriteNode()
    private let cameraNode = SKCameraNode()
    private let audioManager: AudioManager
    
    let overwhelmedNode = SKNode()
    
    init(stateMachine: StateMachine,
         audioManager: AudioManager) {
        self.stateMachine = stateMachine
        self.audioManager = audioManager
        super.init(size: UIScreen.main.bounds.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        print ("moved")
        view.frame.size = UIScreen.main.bounds.size
        view.contentMode = .scaleAspectFit
        scaleMode = .resizeFill
        backgroundImage.size = view.frame.size
        super.didMove(to: view)
        view.ignoresSiblingOrder = true
        
        audioManager.onSoundFinished = { [weak self] in
            self?.fire(trigger: .voice)
        }
    
        let textures = OverwhelmingLoader().loadAll()
        let nodes = textures.map { SKSpriteNode(texture: $0) }
        
        nodes.forEach(overwhelmedNode.addChild)
        addChild(overwhelmedNode)
        overwhelmedNode.isHidden = true
        
        
        anchorPoint = .init(x: 0.5, y: 0.5)
        backgroundColor = .gray
        camera = cameraNode
        
        addChild(cameraNode)
        cameraNode.addChild(subtitleLabel)
        addChild(backgroundImage)
        
        backgroundImage.position = .zero
        backgroundImage.size = frame.size
        
        subtitleLabel.zPosition = 10
        subtitleLabel.fontColor = .black
        subtitleLabel.numberOfLines = 0
        subtitleLabel.preferredMaxLayoutWidth = frame.width * 0.9
        subtitleLabel.horizontalAlignmentMode = .center
        
        
        overwhelmedNode.zPosition = 1000
        
        DispatchQueue.main.async {
            
            self.renderIfNeeded()
        }
        
        view.layoutIfNeeded()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            fire(trigger: .touch(location))
        }
    }
    
    private func fire(trigger: Trigger) {
        print("FIRED", trigger)
        let transition = stateMachine.handle(trigger: trigger)
        handle(transition: transition)
    }
    
    private func handle(transition: Transition?) {
        switch transition {
        case let .zoomIn(position, scale, duration):
            zoom(at: position, scale: scale, duration: duration) {
                self.renderIfNeeded()
            }
        case .reset:
            cameraNode.run(.group([
                .scale(to: 1, duration: 0),
                .move(to: .zero, duration: .zero)
            ]))
            self.renderIfNeeded()
        case .none:
            self.renderIfNeeded()
            
        }
    }
    
    private func renderIfNeeded() {
        guard stateMachine.isDirty else { return }
        stateMachine.isDirty = false
        print ("rendering")
        if stateMachine.currentState == .overwhelming {
            renderOverwhelming()
            return
        }
        
        if let subtitle = stateMachine.currentState.subtitle {
            render(subtitle: subtitle)
        } else {
            subtitleLabel.text = nil
        }
        
        if let audio = stateMachine.currentState.audios {
            render(audio: audio)
        }
        
        if let imageNames = stateMachine.currentState.imageNames {
            backgroundImage.run(.repeatForever(.animate(
                with: imageNames.map { .init(imageNamed: $0) },
                timePerFrame: 0.3)))
        }
    }
    
    private func renderOverwhelming() {
        overwhelmedNode.isHidden = false
        overwhelmedNode.run(.repeatForever(.sequence([
            .run {
                let action: SKAction = Bool.random() ? .hide() : .hide().reversed()
                self.overwhelmedNode.children.randomElement()?.run(action)
            },
            .wait(forDuration: 0.01)
        ])))
        audioManager.play(audios: [
            Audio(fileName: "talking-6sec", repeatsForever: true, volume: 4.0),
            Audio(fileName: "tapping-6sec", repeatsForever: true, volume: 4.0),
            Audio(fileName: "typing-sound-2", repeatsForever: true, volume: 4.0)
        ])
    }
    
    private func render(subtitle: Subtitle) {
        subtitleLabel.text = subtitle.label
        subtitleLabel.fontColor = subtitle.color
        let margin: CGFloat = 20
        let y: CGFloat
        switch subtitle.position {
        case .center:
            y = .zero
        case .bottom:
            y = frame.minY + subtitleLabel.frame.height / 2 + margin
        case .top:
            y = frame.maxY - subtitleLabel.frame.height - margin
        }
        subtitleLabel.position = .init(x: .zero, y: y)
    }
    
    private func render(audio: [Audio]) {
        audioManager.play(audios: audio)
    }
    
    private func zoom(at position: CGPoint, scale: CGFloat, duration: TimeInterval, then run: @escaping () -> Void) {
        let zoom: SKAction = .group([
            .move(to: position, duration: duration),
            .scale(by: scale, duration: duration)
        ])
        if duration == .zero {
            run()
            cameraNode.run(zoom)
            return
        }
        cameraNode.run(.sequence([ zoom, .run(run) ]))
    }
}
