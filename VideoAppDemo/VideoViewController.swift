//
//  VideoViewController.swift
//  VideoAppDemo
//
//  Created by 平野将章 on 2016/02/26.
//  Copyright © 2016年 Codelust Technologies LLC. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class VideoViewController: AVPlayerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let moviePath = NSBundle.mainBundle().pathForResource("SampleVideo_1280x720_1mb", ofType: "mp4")!
//        let url = NSURL(fileURLWithPath: moviePath)
        let url = NSURL(string: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8")
        let playerItem = AVPlayerItem(URL: url!)
        player = AVPlayer(playerItem: playerItem)
        player!.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}