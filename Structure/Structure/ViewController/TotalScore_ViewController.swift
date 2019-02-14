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
        let transition = CATransition.init()
        transition.duration = 0.45
        transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.push //Transition you want like Push, Reveal
        transition.subtype = CATransitionSubtype.fromTop // Direction like Left to Right, Right to Left
        transition.delegate = self
        view.window!.layer.add(transition, forKey: kCATransition)
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
    
    
    var playerList : [String] = []
    var scoreListLabel : [String] = []
    var winner : [String] = []
    
    @IBOutlet var scoreStack: UIStackView!
    @IBOutlet var playerStack: UIStackView!
    @IBOutlet var winnerStack: UIStackView!
    @IBOutlet weak var makeCornerRound: UIButton!
    @IBOutlet weak var makeCornerRound1: UIButton!
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        makeCornerRound.layer.cornerRadius = 18.0
        makeCornerRound1.layer.cornerRadius = 18.0
        
        if let scoreList = totalPlayerScore {
            let winnerScore = scoreList.max()
            var winnerLabel : [UILabel] = []
            var playerLabel : [UILabel] = []
            var scoreLabel : [UILabel] = []
            for playerNum in scoreList.indices{
                let tempWinner = UILabel(frame: CGRect(x: 0, y: 0, width: winnerStack.frame.width, height: winnerStack.frame.height))
                let tempPlayer = UILabel(frame: CGRect(x: 0, y: 0, width: playerStack.frame.width, height: playerStack.frame.height))
                let tempScore = UILabel(frame: CGRect(x: 0, y: 0, width: scoreStack.frame.width, height: scoreStack.frame.height))
                tempScore.text = "\(totalPlayerScore![playerNum])점"
                tempPlayer.text = "플레이어 \(playerNum + 1)"
                if totalPlayerScore![playerNum] == winnerScore {
                    tempWinner.text = "🏆"
                }
                else{
                    tempWinner.text = " "
                }
                winnerLabel.append(tempWinner)
                playerLabel.append(tempPlayer)
                scoreLabel.append(tempScore)
            }
            for playerNum in scoreList.indices{
                self.winnerStack.addSubview(winnerLabel[playerNum])
                self.playerStack.addSubview(playerLabel[playerNum])
                self.scoreStack.addSubview(scoreLabel[playerNum])
                
            }
        }
        
        
        
        playerLabel.text = playerList.joined(separator: "\u{0085}")
        if let player = gameSetting?.settingPlayer{
            playerLabel.numberOfLines = player
            scoreLabel.numberOfLines = player
            winnerLabel.numberOfLines = player
        }
        if gameSetting?.settingPlayer == 1 {
            playerLabel.adjustsFontSizeToFitWidth = true
        }else{
            playerLabel.sizeToFit()
        }
        scoreLabel.font = playerLabel.font
        winnerLabel.font = playerLabel.font
        scoreLabel.text = scoreListLabel.joined(separator: "\u{0085}")
        winnerLabel.text = winner.joined(separator: "\u{0085}")
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
}
