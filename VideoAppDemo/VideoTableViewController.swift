import UIKit

class VideoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var videos: [Video] = [Video]()
    var videoPlayingCell: VideoTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupVideos()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (!decelerate) {
            playVideo()
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        playVideo()
    }
    
    func playVideo() {
        let autoPlayingRow = ceil((tableView.contentOffset.y + (tableView.frame.height/2)) / CGFloat(calcCellHeight())) - 1
        let autoPlayingCell: VideoTableViewCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: Int(autoPlayingRow), inSection: 0)) as! VideoTableViewCell
        
        if (videoPlayingCell != autoPlayingCell) {
            videoPlayingCell!.stop()
            autoPlayingCell.autoPlay()
            videoPlayingCell = autoPlayingCell
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupVideos() {
        let v1 = Video(
            title: "Ken",
            url: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
            thumbnailUrl: "http://static-assets.komando.com/wp-content/uploads/2015/03/AppleStage-970x546.jpg"
        )
        let v2 = Video(
            title: "Ken",
            url: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
            thumbnailUrl: "http://static-assets.komando.com/wp-content/uploads/2015/03/AppleStage-970x546.jpg"
        )
        let v3 = Video(
            title: "Ken",
            url: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
            thumbnailUrl: "http://static-assets.komando.com/wp-content/uploads/2015/03/AppleStage-970x546.jpg"
        )
        let v4 = Video(
            title: "Ken",
            url: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
            thumbnailUrl: "http://static-assets.komando.com/wp-content/uploads/2015/03/AppleStage-970x546.jpg"
        )
        let v5 = Video(
            title: "Ken",
            url: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
            thumbnailUrl: "http://static-assets.komando.com/wp-content/uploads/2015/03/AppleStage-970x546.jpg"
        )
        
        
        videos.append(v1)
        videos.append(v2)
        videos.append(v3)
        videos.append(v4)
        videos.append(v5)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セクションの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(calcCellHeight())
    }
    
    func calcCellHeight() -> Double {
        let myAppFrameSize = Double(UIScreen.mainScreen().bounds.width)
        
        let boxPadding = 10.0 * 2
        let titleHeight = 21.0
        let mediaViewTopMargin = 10.0
        let mediaViewHeight = (myAppFrameSize - 20.0) / 16 * 9
        let publishedAtTopMargin = 10.0
        let publishedAtHeight = 21.0
        
        return boxPadding + titleHeight + mediaViewTopMargin + mediaViewHeight + publishedAtTopMargin + publishedAtHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell: VideoTableViewCell = tableView.dequeueReusableCellWithIdentifier("VideoTableCell", forIndexPath: indexPath) as! VideoTableViewCell
        cell.setCell(videos[indexPath.row])
        
        if (indexPath.section == 0 && indexPath.row == 0 && videoPlayingCell == nil) {
            cell.autoPlay()
            videoPlayingCell = cell
        }
        
        return cell
    }
}