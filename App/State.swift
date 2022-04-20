struct State: Equatable {
    static func == (lhs: State, rhs: State) -> Bool {
        lhs.audios?.map { $0.fileName } == rhs.audios?.map { $0.fileName } && lhs.imageNames == rhs.imageNames
    }
    
    let audios: [Audio]?
    let subtitle: Subtitle?
    let imageNames: [String]?
    let transition: Transition?
    
    init(audio: Audio? = nil,
        label: String,
        position: Subtitle.Position) {
        self.init(audio: audio, subtitle: .init(
            label: label, position: position),
                  imageNames: nil)
    }
    
    init(audio: Audio? = nil,
         subtitle: Subtitle? = nil,
         imageNames: [String]? = nil,
         transition: Transition? = nil
    ) {
        if let audio = audio {
            self.audios = [audio]
        } else {
            self.audios = nil
        }
        self.subtitle = subtitle
        self.transition = transition
        self.imageNames = imageNames
    }
    
    init(audio: Audio? = nil,
         subtitle: Subtitle? = nil,
         imageName: String? = nil,
         transition: Transition? = nil
    ) {
        if let audio = audio {
            self.audios = [audio]
        } else {
            self.audios = nil
        }
        self.subtitle = subtitle
        self.transition = transition
        if let imageName = imageName {
            self.imageNames = [imageName]
        } else {
            self.imageNames = nil
        }
    }
    init(audios: [Audio]? = nil,
         subtitle: Subtitle? = nil,
         imageName: String? = nil,
         transition: Transition? = nil
    ) {
        self.audios = audios
        self.subtitle = subtitle
        self.transition = transition
        if let imageName = imageName {
            self.imageNames = [imageName]
        } else {
            self.imageNames = nil
        }
    }
    init(audios: [Audio]? = nil,
         subtitle: Subtitle? = nil,
         imageNames: [String]? = nil,
         transition: Transition? = nil
    ) {
        self.audios = audios
        self.subtitle = subtitle
        self.transition = transition
        self.imageNames = imageNames
    }
}
