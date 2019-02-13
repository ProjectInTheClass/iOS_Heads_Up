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
    var scoreListLabel : [String] = ["🌟Score🌟"]
    var winner : [Int]?
    var delegate : TotalScoreDelegate?
    @IBOutlet var scoreLabel2: UILabel!
    @IBOutlet var winnerLabel: UILabel!
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
    
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: false)
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
