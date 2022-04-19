struct Subtitle {
    let label: String
    enum Position {
        case top
        case center
        case bottom
    }
    let position: Position
}
