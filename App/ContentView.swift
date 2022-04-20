import SwiftUI
import SpriteKit

let stateMachine = StateMachine()

struct ContentView: View {
    let audioManager: AudioManager
    var body: some View {
        SpriteView(scene: PresentationScene(
            stateMachine: stateMachine,
            audioManager: audioManager
        ))
    }
}
