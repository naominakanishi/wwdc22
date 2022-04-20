import CoreGraphics

final class StateMachine {
    private var currentStateIndex = 0
    var currentState: State { states[currentStateIndex] }
    var isDirty = true
    
    func handle(trigger: Trigger) -> Transition? {
        let transition = currentState.transition
        if isValid(trigger: trigger),
           currentStateIndex < states.count - 1
        {
            currentStateIndex += 1
            isDirty = true
            return transition
        }
        return nil
    }
    
    private func isValid(trigger: Trigger) -> Bool {
        switch trigger {
        case .touch where currentStateIndex == 0:
            return true
        case let .touch(position):
            return isValidPosition(position)
        case .voice where currentStateIndex <= 6:
            return true
        case .voice where currentStateIndex == 8:
            return true
        case.voice where currentStateIndex == 9:
            return true
        case.voice where currentStateIndex == 11:
            return true
        case.voice where currentStateIndex == 12:
            return true
        case.voice where currentStateIndex == 14:
            return true
        case.voice where currentStateIndex == 16:
            return true
        case.voice where currentStateIndex == 17:
            return true

        case.voice where currentStateIndex == 18:
            return true
        case.voice where currentStateIndex == 19:
            return true
        case.voice where currentStateIndex == 20:
            return true
        default:
            break
        }
        return false
    }
    
    private func isValidPosition(_ position: CGPoint) -> Bool {
        switch currentState.imageNames {
        case ["classroom-me"] where position.in(bounds: .init(x: 454, y: 161, width: 100, height: 100)):
            return true
        case ["classroom-typing"] where position.in(bounds: .init(x: 461, y: 36, width: 100, height: 100)):
            return true
        case ["classroom-talking"] where position.in(bounds: .init(x: 138, y: 155, width: 300, height: 100)):
            return true
        case ["classroom-tappingPen"] where position.in(bounds: .init(x: 253, y: 26, width: 100, height: 100)):
            return true
        default:
            return false
        }
    }
}
