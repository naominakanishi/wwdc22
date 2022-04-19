struct State: Equatable {
    static func == (lhs: State, rhs: State) -> Bool {
        lhs.audioName == rhs.audioName && lhs.imageNames == rhs.imageNames
    }
    
    let audioName: String?
    let subtitle: Subtitle?
    let imageNames: [String]?
    let transition: Transition?
    
    init (label: String, position: Subtitle.Position) {
        self.init(audioName: nil, subtitle: .init(
            label: label, position: position),
                  imageName: nil)
    }
    
    init(audioName: String? = nil,
         subtitle: Subtitle? = nil,
         imageNames: [String]? = nil,
         transition: Transition? = nil
    ) {
        self.audioName = audioName
        self.subtitle = subtitle
        self.transition = transition
        self.imageNames = imageNames
    }
    
    init(audioName: String? = nil,
         subtitle: Subtitle? = nil,
         imageName: String? = nil,
         transition: Transition? = nil
    ) {
        self.audioName = audioName
        self.subtitle = subtitle
        self.transition = transition
        if let imageName = imageName {
            self.imageNames = [imageName]
        } else {
            self.imageNames = nil
        }
    }
}
