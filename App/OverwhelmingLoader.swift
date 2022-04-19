import SpriteKit

struct OverwhelmingLoader {
    enum Trait: String {
        
        case overwhelmed
        case talking
        case tapping
        case typing
        case green
        case pink
        case yellow
        case outline
        case fill
        
        static var actions: [Trait] {
            [
                .overwhelmed,
                .talking,
                .tapping,
                .typing
            ]
        }
        
        static var colors: [Trait] {
            [
                .pink,
                .green,
                .yellow
            ]
        }
        
        static var type: [Trait] {
            [
                .outline,
                .fill
            ]
        }
    }
    
    func loadAll() -> [SKTexture] {
        let colorCombined = Trait.actions.flatMap { action in
            Trait.colors.map { color in
                return (action, color)
            }
        }
        
        let typeCombined = colorCombined.flatMap { (action, color) in
            Trait.type.map { type in
                return (action, color, type)
            }
        }
        
        return typeCombined.map { (action, color, type) in
            return action.rawValue + "-" + color.rawValue + "-" + type.rawValue
        }
        .filter { UIImage(named: $0) != nil }
        .compactMap { name in
            return SKTexture(imageNamed: name)
        }
    }
}
