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
    
    @IBOutlet var baseView: UIView!
    
    var playerList : [String] = []
    var scoreListLabel : [String] = []
    var winner : [String] = []
    
    @IBOutlet var labelFinalScore: UILabel!
    @IBOutlet var scoreStack: UIStackView!
    @IBOutlet var playerStack: UIStackView!
    @IBOutlet var winnerStack: UIStackView!
    @IBOutlet weak var makeCornerRound: UIButton!
    @IBOutlet weak var makeCornerRound1: UIButton!
    override func viewDidLoad() {
        baseView.layer.cornerRadius = 18.0
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        makeCornerRound.layer.cornerRadius = 18.0
        makeCornerRound1.layer.cornerRadius = 18.0
        makeCornerRound.setTitle( NSLocalizedString("Home", comment: ""), for: .normal)
        makeCornerRound1.setTitle( NSLocalizedString("New Game", comment: ""), for: .normal)
        labelFinalScore.text = NSLocalizedString("💯 Final Score", comment: "")
        if let scoreList = totalPlayerScore {
            let winnerScore = scoreList.max()
            var winnerLabel : [UILabel] = []
            var playerLabel : [UILabel] = []
            var scoreLabel : [UILabel] = []
            for playerNum in scoreList.indices{
                let tempWinner = UILabel(frame: CGRect(x: 0, y: 0, width: winnerStack.frame.width, height: winnerStack.frame.height))
                let tempPlayer = UILabel(frame: CGRect(x: 0, y: 0, width: winnerStack.frame.width, height: winnerStack.frame.height))
                let tempScore = UILabel(frame: CGRect(x: 0, y: 0, width: winnerStack.frame.width, height: winnerStack.frame.height))
                tempScore.text = "\(scoreList[playerNum])\(NSLocalizedString("p", comment: ""))"
                tempPlayer.text = "\(NSLocalizedString("Player", comment: "")) \(playerNum + 1)"
                if totalPlayerScore![playerNum] == winnerScore {
                    tempWinner.text = "🏆"
                    tempScore.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
                }
                else{
                    tempWinner.text = " "
                }
                tempPlayer.font = tempPlayer.font.withSize(35)
                tempPlayer.adjustsFontSizeToFitWidth = true
                let fontSize = tempPlayer.font.pointSize
                tempScore.font = tempPlayer.font.withSize(fontSize - 3)
                tempWinner.font = tempPlayer.font.withSize(fontSize + 4)
                tempWinner.textAlignment = NSTextAlignment.right
                tempPlayer.textAlignment = NSTextAlignment.center
                tempScore.textAlignment = NSTextAlignment.left
                winnerLabel.append(tempWinner)
                playerLabel.append(tempPlayer)
                scoreLabel.append(tempScore)
            }
            for playerNum in scoreList.indices{
                winnerStack.addArrangedSubview(winnerLabel[playerNum])
                playerStack.addArrangedSubview(playerLabel[playerNum])
                scoreStack.addArrangedSubview(scoreLabel[playerNum])

            }
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
}
