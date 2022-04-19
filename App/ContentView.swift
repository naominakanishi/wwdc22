import SwiftUI
import SpriteKit

let stateMachine = StateMachine()

struct ContentView: View {
    var body: some View {
        SpriteView(scene: PresentatonScene(stateMachine: stateMachine))
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
        
    }
}
