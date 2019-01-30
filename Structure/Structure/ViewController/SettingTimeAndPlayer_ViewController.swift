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
    var settingPlayerCount : Int?
    var timeLimit : Int?
    
    var delegate : SettingTimeAndPlayerDelegateProtocol?
    
    @IBAction func ClickStartButton(_ sender: Any) {
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
