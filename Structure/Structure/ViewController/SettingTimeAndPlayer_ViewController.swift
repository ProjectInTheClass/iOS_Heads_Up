//
//  SettingTimeAndPlayer_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 30/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

protocol SettingTimeAndPlayerDelegateProtocol {
    func ShowNextView()
}


class SettingTimeAndPlayer_ViewController: UIView {
    var gameSetting = GameSetting()
    var delegate : SettingTimeAndPlayerDelegateProtocol?
    
    //To Do : assign timeLimit, settingPlayer value
    
    
    @IBAction func closeButton(_ sender: Any) {
        self.removeFromSuperview()
    }
    @IBAction func ClickStartButton(_ sender: Any) {
        self.gameSetting.timeLimit = 5
        gameSetting.settingPlayer = 3
        gameSetting.settingPlayerCount = 0
        gameSetting.playerScore?.removeAll()
        delegate?.ShowNextView()
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
