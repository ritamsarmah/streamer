//
//  SettingsManager.swift
//  VideoStreamer
//
//  Created by Ritam Sarmah on 8/9/18.
//  Copyright © 2018 Ritam Sarmah. All rights reserved.
//

import Foundation

class SettingsManager {
    
    static let shared = SettingsManager()
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    var playbackSpeed: Float {
        get {
            return defaults.float(forKey: Settings.Speed)
        }
        set {
            if Settings.Speeds.index(of: playbackSpeed) != nil {
                defaults.set(newValue, forKey: Settings.Speed)
            }
        }
    }
    
    var resumePlayback: Bool {
        get {
            return defaults.bool(forKey: Settings.ResumePlayback)
        }
        set {
            defaults.set(newValue, forKey: Settings.ResumePlayback)
        }
    }
    
    var backgroundPlay: Bool {
        get {
            return defaults.bool(forKey: Settings.BackgroundPlay)
        }
        set {
            defaults.set(newValue, forKey: Settings.BackgroundPlay)
        }
    }
    
    var lockLandscapePlayback: Bool {
        get {
            return defaults.bool(forKey: Settings.LockLandscapePlayback)
        }
        set {
            defaults.set(newValue, forKey: Settings.LockLandscapePlayback)
        }
    }
    
    func registerDefaults() {
        UserDefaults.standard.register(defaults: [Settings.Speed : 1.0])
        UserDefaults.standard.register(defaults: [Settings.ResumePlayback : true])
        UserDefaults.standard.register(defaults: [Settings.BackgroundPlay : false])
        UserDefaults.standard.register(defaults: [Settings.LockLandscapePlayback : false])
    }
}
