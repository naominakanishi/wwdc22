import UIKit
struct Subtitle {
    internal init(label: String, position: Subtitle.Position, color: UIColor = .black) {
        self.label = label
        self.position = position
        self.color = color
    }
    
    let label: String
    enum Position {
        case top
        case center
        case bottom
    }
    let position: Position
    let color: UIColor
}
