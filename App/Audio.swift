//enum Audio: String {
//    case contextWWDC1 = "context-wwdc-1"
//    case contextWWDC2 = "context-wwdc-2"
//    case introWWDC1 = "intro-wwdc-1"
//}
import AVFoundation

func log(_ message: Any...) {
    var content: String = "empty"
    dump(message, to: &content)
    NSLog("Teste! " + content)
}

struct Audio {
    let fileName: String
    let repeatsForever: Bool
    let volume: Float
    let delay: DispatchTimeInterval?
    
    internal init(fileName: String, repeatsForever: Bool, volume: Float, delay: DispatchTimeInterval? = nil) {
        self.fileName = fileName
        self.repeatsForever = repeatsForever
        self.volume = volume
        self.delay = delay
    }
}

class AudioManager: NSObject {
    
    private var playableAudios: [String: AVAudioPlayer] = [:]
    
    var onSoundFinished: (() -> Void)?
    
    func initialize() {
        guard let allUrls: [URL] = Bundle.main.urls(forResourcesWithExtension: "m4a", subdirectory: nil)
        else { return }
        let allPlayers = allUrls.map { (url: URL) -> AVAudioPlayer in
            let player = try! AVAudioPlayer(contentsOf: url)
            player.delegate = self
            player.prepareToPlay()
            return player
        }
        playableAudios = .init(uniqueKeysWithValues: zip(
            allUrls.map { $0.lastPathComponent.replacingOccurrences(of: ".m4a", with: "") },
            allPlayers
        ).map { ($0, $1) })
    }
    
    func play(audios: [Audio]) {
        print("Playing", audios)
        audios
            .map { ($0, playableAudios[$0.fileName]) }
            .forEach { (audio, player) in
                player?.volume = audio.volume
                let delay = audio.delay ?? .seconds(0)
                if audio.repeatsForever {
                    player?.numberOfLoops = -1
                } else {
                    player?.numberOfLoops = 0
                }
                DispatchQueue.global().asyncAfter(deadline: .now().advanced(by: delay)) {
                    player?.play()
                }
            }
    }
}

extension AudioManager: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        print("Completed audio", player)
        let players = playableAudios.map { $0.value }
        let allDone = players
            .filter { $0.numberOfLoops != -1 }
            .allSatisfy { !$0.isPlaying }
        if allDone {
            onSoundFinished?()
        }
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("MAMOU", error as Any)
    }
}
