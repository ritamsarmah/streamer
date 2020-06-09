//
//  Constants.swift
//  VideoStreamer
//
//  Created by Ritam Sarmah on 1/5/18.
//  Copyright © 2018 Ritam Sarmah. All rights reserved.
//

import Foundation
import XCDYouTubeKit

enum YouTubeVideoQuality {
    static let hd720 = NSNumber(value: XCDYouTubeVideoQuality.HD720.rawValue)
    static let medium360 = NSNumber(value: XCDYouTubeVideoQuality.medium360.rawValue)
    static let small240 = NSNumber(value: XCDYouTubeVideoQuality.small240.rawValue)
}

enum VideoInfoKeys: String {
    case title = "Title"
    case duration = "Duration"
    case url = "URL"
    case filename = "Filename"
    case thumbnail = "Thumbnail"
}

enum Storyboard {
    static let VideoCellIdentifier = "VideoCell"
    static let AVPlayerVCSegue = "ShowPlayer"
    static let VideoInfoSegue = "ShowVideoInfo"
    static let PlayerFromInfoSegue = "ShowPlayerFromInfo"
}

enum Settings {
    static let Speed = "playbackSpeed"
    static let ResumePlayback = "doesResumePlayback"
    static let BackgroundPlay = "backgroundPlay"
    static let LockLandscapePlayback = "lockLandscapePlayback"
    static let Speeds: [Float] = [0.25, 0.5, 1.0, 1.25, 1.5, 2.0]
}

enum Colors {
    static let theme = UIColor.orange //UIColor(red: 199/255, green: 0/255, blue: 57/255, alpha: 1.0)
    
    enum Button {
        static let backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.0)
        static let textDisabledColor = UIColor.gray
        static let progressColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        static let highlightColor = UIColor.gray
    }
}

enum DownloadState {
    case notDownloaded, inProgress, paused, downloaded, disabled
}
