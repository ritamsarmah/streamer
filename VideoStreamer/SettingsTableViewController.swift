//
//  SettingsTableViewController.swift
//  VideoStreamer
//
//  Created by Ritam Sarmah on 8/31/16.
//  Copyright © 2016 Ritam Sarmah. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var speedValueLabel: UILabel!
    @IBOutlet weak var resumePlaybackSwitch: UISwitch!
    @IBOutlet weak var backgroundPlaySwitch: UISwitch!
    @IBOutlet weak var landscapeLockSwitch: UISwitch!
    @IBOutlet weak var labelLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var clearDownloadsCell: UITableViewCell!
    @IBOutlet weak var clearCacheCell: UITableViewCell!
    
    var initialOffsetIgnored = false
    var top: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelLeadingConstraint.constant = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        speedValueLabel.text = "\(SettingsManager.shared.playbackSpeed)"
        resumePlaybackSwitch.isOn = SettingsManager.shared.resumePlayback
        backgroundPlaySwitch.isOn = SettingsManager.shared.backgroundPlay
        landscapeLockSwitch.isOn = SettingsManager.shared.lockLandscapePlayback
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resumePlaybackChanged(_ sender: UISwitch) {
        SettingsManager.shared.resumePlayback = sender.isOn
    }
    
    @IBAction func backgroundPlayChanged(_ sender: UISwitch) {
        SettingsManager.shared.backgroundPlay = sender.isOn
    }
    
    @IBAction func landscapeLockChanged(_ sender: UISwitch) {
        SettingsManager.shared.lockLandscapePlayback = sender.isOn
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            Alert.presentClearCache(on: self)
        } else if indexPath.section == 1 && indexPath.row == 1 {
            Alert.presentClearDownloads(on: self)
        } else {
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UIScrollViewDelegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let relativeYOffset = scrollView.contentOffset.y + scrollView.contentInset.top
        if !initialOffsetIgnored {
            initialOffsetIgnored = true
            return
        }
        
        if top == nil {
            top = relativeYOffset
        } else {
            if relativeYOffset < top! - 60 {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
