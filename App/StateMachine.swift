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
        case let .touch(position):
            return isValidPosition(position)
        case .voice where currentStateIndex < 5:
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
        case ["classroom-typing"] where position.in(bounds: .init(x: 458, y: 105, width: 100, height: 100)):
            return true
        case ["classroom-me"], ["classroom-typing"]:
            return false
        default:
            return true
        }
    }
}
