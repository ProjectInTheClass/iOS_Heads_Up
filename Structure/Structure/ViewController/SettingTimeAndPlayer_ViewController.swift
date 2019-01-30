//
//  SettingTimeAndPlayer_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 30/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class SettingTimeAndPlayer_ViewController: UIView {
    var settingPlayerCount : Int?
    var timeLimit : Int?
    @IBAction func ClickStartButton(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyBoard.instantiateViewController(withIdentifier: "GameStart") as? Start_ViewController
       // self.present
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
