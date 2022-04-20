import SwiftUI

@main
struct TemplateApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    private let audioManager = AudioManager()
    
    init() {
        audioManager.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(audioManager: audioManager)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        .landscape
    }
}
