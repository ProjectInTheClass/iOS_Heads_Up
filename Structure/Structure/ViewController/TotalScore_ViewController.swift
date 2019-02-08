//
//  TotalScore_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

protocol TotalScoreDelegate {
    func MoreGame()
    func GoHome()
}


class TotalScore_ViewController: UIViewController {
    var gameSetting : GameSetting?
    var delegate : TotalScoreDelegate?
    var totalPlayerScore : [Int]?
    var scoreListLabel : [String] = ["🌟Score🌟"]
    var winner : [Int]?
    @IBOutlet var scoreLabel2: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBAction func TouchHomeButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        self.gameSetting?.settingPlayerCount = 0
        self.gameSetting?.playerScore = nil
        delegate?.GoHome()
    }
    @IBAction func TouchMoreGame(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        self.gameSetting?.settingPlayerCount = 0
        self.gameSetting?.playerScore = nil
        delegate?.MoreGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let scoreList = totalPlayerScore {
            let winnerScore = scoreList.max()
            for playerNum in scoreList.indices{
                scoreListLabel.append("player\(playerNum+1) :\t\(totalPlayerScore![playerNum])점")
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
        winnerLabel.text = "👑\nPlayer\n\(winnerString)"
        winnerLabel.adjustsFontSizeToFitWidth = true
        scoreLabel2.text = scoreListLabel.joined(separator: "\n")
        scoreLabel2.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? Navigation_ViewController {
            if let childVC = vc.topViewController as? Category_ViewController{
                childVC.gameSetting = self.gameSetting
            }
        }
        if let vc = segue.destination as? Initial_ViewController {
            vc.gameSetting = nil   }
    }
    
}
