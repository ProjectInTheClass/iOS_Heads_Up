//
//  TotalScore_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit


class TotalScore_ViewController: UIViewController {
    var gameSetting : GameSetting?
    var totalPlayerScore : [Int]?
    var scoreListLabel : [String] = ["🌟Score🌟"]
    var winner = 0
    @IBOutlet var scoreLabel2: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBAction func TouchHomeButton(_ sender: Any) {
        
    }
    @IBAction func TouchMoreGame(_ sender: Any) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let scoreList = totalPlayerScore {
            for playerNum in scoreList.indices{
                scoreListLabel.append("player\(playerNum+1) :\t\(totalPlayerScore![playerNum])점")
                if totalPlayerScore![playerNum] > totalPlayerScore![winner]{
                    winner = playerNum
                }
            }
        }else{}
        winnerLabel.text = "👑\nPlayer\n\(winner + 1)"
        winnerLabel.adjustsFontSizeToFitWidth = true
        scoreLabel2.text = scoreListLabel.joined(separator: "\n")
        scoreLabel2.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }
    



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? Category_ViewController {
            self.gameSetting?.settingPlayerCount = 0
            self.gameSetting?.playerScore = nil
            vc.gameSetting = self.gameSetting
        }
    }
    

}
