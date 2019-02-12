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
    var winner : [Int]?
    @IBOutlet var scoreLabel2: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBAction func TouchHomeButton(_ sender: Any) {
        
        self.gameSetting?.settingPlayerCount = 0
        self.gameSetting?.playerScore = nil
          navigationController!.popToViewController(navigationController!.viewControllers[0], animated: true)


    }
    @IBAction func TouchMoreGame(_ sender: Any) {
        self.gameSetting?.settingPlayerCount = 0
        self.gameSetting?.playerScore = nil
          navigationController!.popToViewController(navigationController!.viewControllers[1], animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let scoreList = totalPlayerScore {
            let winnerScore = scoreList.max()
            for playerNum in scoreList.indices{
                scoreListLabel.append("player\(playerNum+1)  :  \(totalPlayerScore![playerNum])점")
                if totalPlayerScore![playerNum] == winnerScore {
                    if var _ = winner{
                        winner!.append(playerNum + 1)
                    }else{
                        winner = [playerNum + 1]
                    }
                }
            }
        }else{}
        let winnerString = winner!.map(String.init).joined(separator: "\t")
        winnerLabel.text = "👑\u{0085}Player\u{0085}\(winnerString)"
        winnerLabel.sizeToFit()
        
        scoreLabel2.text = scoreListLabel.joined(separator: "\u{0085}")
        scoreLabel2.sizeToFit()
        // Do any additional setup after loading the view.
    }
    
    
    

    
}
