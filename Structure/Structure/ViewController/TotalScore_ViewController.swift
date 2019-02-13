//
//  TotalScore_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
protocol TotalScoreDelegate {
    func goHome()
    func goCategory()
}


class TotalScore_ViewController: UIViewController, CAAnimationDelegate {
    var gameSetting : GameSetting?
    var totalPlayerScore : [Int]?

    var delegate : TotalScoreDelegate?
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBAction func TouchHomeButton(_ sender: Any) {
        self.gameSetting?.settingPlayerCount = 0
        self.gameSetting?.playerScore = nil
        self.dismiss(animated: true, completion: nil)
        delegate?.goHome()



    }
    @IBAction func TouchMoreGame(_ sender: Any) {
        self.gameSetting?.settingPlayerCount = 0
        self.gameSetting?.playerScore = nil
        let transition = CATransition.init()
        transition.duration = 0.45
        transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.push //Transition you want like Push, Reveal
        transition.subtype = CATransitionSubtype.fromTop // Direction like Left to Right, Right to Left
        transition.delegate = self
        view.window!.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: true, completion: nil)
        delegate?.goCategory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    var playerList : [String] = []
    var scoreListLabel : [String] = []
    var winner : [String] = []
    
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        if let scoreList = totalPlayerScore {
            let winnerScore = scoreList.max()
            for playerNum in scoreList.indices{
                scoreListLabel.append("\(totalPlayerScore![playerNum])점")
                playerList.append("플레이어 \(playerNum + 1)")
                if totalPlayerScore![playerNum] == winnerScore {
                    winner.append("🏆")
                }
                else{
                    winner.append(" ")
                }
            }
        }
        scoreLabel.text = scoreListLabel.joined(separator: "\u{0085}")
        winnerLabel.sizeToFit()
        playerLabel.text = playerList.joined(separator: "\u{0085}")
        winnerLabel.sizeToFit()
        winnerLabel.text = winner.joined(separator: "\u{0085}")
        winnerLabel.sizeToFit()
        
       
        // Do any additional setup after loading the view.
    }
    
    
    

    
}
