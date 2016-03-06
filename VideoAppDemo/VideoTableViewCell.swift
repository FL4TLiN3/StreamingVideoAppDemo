import UIKit
import WebImage
import AVFoundation

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var playerView: PlayerView!
    
    var video: Video?
    var player: AVPlayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(video: Video) {
        self.video = video
        self.title.text = self.video!.title as String
        self.thumbnail.sd_setImageWithURL(self.video!.thumbnailUrl!)
    }
    
    func autoPlay() {
        thumbnail.hidden = true
        
        let playerItem = AVPlayerItem.init(URL: self.video!.url!)
        self.player = AVPlayer(playerItem: playerItem)
        self.playerView.player = self.player!
        player!.play()
    }
    
    func stop() {
        thumbnail.hidden = false
        player!.pause()
        player = nil
    }
}
