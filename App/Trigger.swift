import SpriteKit

enum Trigger {
    case touch(CGPoint)
    case voice
}

enum Transition {
    case zoomIn(CGPoint, CGFloat, TimeInterval)
    case reset
  
}
