//
//  Score_ViewController.swift
//
//
//  Created by 손희덕 on 12/02/2019.
//
import UIKit


class Score_ViewController: UIViewController, CAAnimationDelegate, TotalScoreDelegate {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var passLabel: UILabel!
    @IBOutlet var anotherCategoryButton: UIButton!
    
    @IBOutlet weak var makeCornerRound4: UIView!
    @IBOutlet weak var makeCornerRound5: UIView!
    @IBOutlet var playerLabel: UILabel!
    var game : GameController?
    var gameSetting : GameSetting?
    
    
    override func viewDidLoad() {
        gameSetting!.settingPlayerCount += 1
        if let player = gameSetting?.settingPlayerCount{
            playerLabel.text = "플레이어 \(player)"
        }else{
            playerLabel.isHidden = true
        }
        makeCornerRound4.layer.cornerRadius = 10.0
        makeCornerRound5.layer.cornerRadius = 10.0
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        game?.GameScore()
        
        correctLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        correctLabel.text = game?.correctList?.joined(separator: "\u{0085}")         //make String from array
        correctLabel.sizeToFit()
        passLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        passLabel.text = game?.passList?.joined(separator: "\u{0085}")
        passLabel.sizeToFit()
        scoreLabel.text = "게임 점수 : \(game!.gameScore)"
        scoreLabel.adjustsFontSizeToFitWidth = true
        nextButton.setTitle("계속하기", for: .normal)
        if let _ = gameSetting?.playerScore{
            gameSetting!.playerScore?.append(game!.gameScore)
        }else{
            gameSetting?.playerScore = [game!.gameScore]
        }
        if gameSetting?.settingPlayer == gameSetting?.settingPlayerCount {
            nextButton.setTitle("최종 점수", for: .normal)
        }
    }
    
    
    //function of ScorePopup_ViewController, Reset : does not send any data. and return to Start
    
    //function of ScorePopup_ViewController,  Next: send score and increase SettingPlayerCount. and return to category
    @IBAction func TouchContinue(_ sender: Any) {
        if gameSetting!.settingPlayerCount == gameSetting!.settingPlayer{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let totalScoreViewController = storyBoard.instantiateViewController(withIdentifier: "TotalScore") as? TotalScore_ViewController
            totalScoreViewController!.delegate = self
            totalScoreViewController!.totalPlayerScore = gameSetting!.playerScore
            totalScoreViewController!.gameSetting = self.gameSetting
            let transition = CATransition.init()
            transition.duration = 0.45
            transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.default)
            transition.type = CATransitionType.push //Transition you want like Push, Reveal
            transition.subtype = CATransitionSubtype.fromBottom // Direction like Left to Right, Right to Left
            transition.delegate = self
            view.window!.layer.add(transition, forKey: kCATransition)
            self.present(totalScoreViewController!, animated: false, completion: nil)
        }else{
            let transition = CATransition.init()
            transition.duration = 0.45
            transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.default)
            transition.type = CATransitionType.push //Transition you want like Push, Reveal
            transition.subtype = CATransitionSubtype.fromRight // Direction like Left to Right, Right to Left
            transition.delegate = self
            view.window!.layer.add(transition, forKey: kCATransition)
            navigationController!.popToViewController(navigationController!.viewControllers[2], animated: false)
        }
    }
    
    func goHome(){
        navigationController!.popToViewController(navigationController!.viewControllers[0], animated: true)

    }
    func goCategory(){
        navigationController!.popToViewController(navigationController!.viewControllers[1], animated: true)

    }
    @IBAction func TouchAnotherCategory(_ sender: Any) {
        navigationController!.popToViewController(navigationController!.viewControllers[2], animated: true)
        gameSetting!.settingPlayerCount -= 1
        gameSetting?.playerScore?.removeLast()

        
    }
    
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
