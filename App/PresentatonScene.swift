import SpriteKit

final class PresentatonScene: SKScene {
    private let stateMachine: StateMachine
    private let subtitleLabel = SKLabelNode()
    private let backgroundImage = SKSpriteNode()
    private let cameraNode = SKCameraNode()
    
    init(stateMachine: StateMachine) {
        self.stateMachine = stateMachine
        super.init(size: UIScreen.main.bounds.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
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
        
        renderIfNeeded()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            print(location)
            let transition = stateMachine.handle(trigger: .touch(location))
            handle(transition: transition)
        }
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
        if let subtitle = stateMachine.currentState.subtitle {
            render(subtitle: subtitle)
        } else {
            subtitleLabel.text = nil
        }
        if let imageNames = stateMachine.currentState.imageNames {
            backgroundImage.run(.repeatForever(.animate(
                with: imageNames.map { .init(imageNamed: $0) },
                timePerFrame: 0.3)))
        }
    }
    
    private func render(subtitle: Subtitle) {
        subtitleLabel.text = subtitle.label
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
