import Foundation

class Video: NSObject {
    var title: NSString
    var url: NSURL?
    var thumbnailUrl: NSURL?
    
    init(title: String, url: String, thumbnailUrl: String){
        self.title = title
        self.url = NSURL(string: url)
        self.thumbnailUrl = NSURL(string: thumbnailUrl)
    }
}
