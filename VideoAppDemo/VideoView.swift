import UIKit
import AVFoundation

class PlayerView: UIView {
    override class func layerClass() -> AnyClass{
        return AVPlayerLayer.self
    }
    
    var player: AVPlayer {
        get {
            return (self.layer as! AVPlayerLayer).player!
        }
        set(player) {
            (self.layer as! AVPlayerLayer).player = player
        }
    }
}