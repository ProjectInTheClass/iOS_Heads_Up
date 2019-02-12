//
//  Score_ViewController.swift
//  
//
//  Created by 손희덕 on 12/02/2019.
//

import UIKit

protocol ScoreDelegateProtocol {
    func continueGame()
    func goCategory()
    func MoreGameinGameView()
    func GoHomeInGameView()
}

class Score_ViewController: UIViewController, TotalScoreDelegate {
    
    var delegate: ScoreDelegateProtocol?
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var passLabel: UILabel!
    @IBOutlet var anotherCategoryButton: UIButton!
    
    var game : GameController?
    var gameSetting : GameSetting?

    override func viewDidLoad() {
        super.viewDidLoad()
        game?.GameScore()
        correctLabel.text = game?.correctList?.joined(separator: "\u{0085}")         //make String from array
        correctLabel.sizeToFit()
        passLabel.text = game?.passList?.joined(separator: "\u{0085}")
        passLabel.sizeToFit()
        scoreLabel.text = "Score : \(game?.gameScore)"
        scoreLabel.adjustsFontSizeToFitWidth = true
        nextButton.setTitle("Next Game", for: .normal)
        if let _ = gameSetting?.playerScore{
            gameSetting!.playerScore?.append(game!.gameScore)
        }else{
            gameSetting?.playerScore = [game!.gameScore]
        }
        if gameSetting?.settingPlayer == (gameSetting?.settingPlayerCount)! + 1 {
            anotherCategoryButton.isEnabled = false
            anotherCategoryButton.isHidden = true
            nextButton.setTitle("최종 점수", for: .normal)
        }else{
            gameSetting!.settingPlayerCount += 1
        }
    }
    
    
    //function of ScorePopup_ViewController, Reset : does not send any data. and return to Start
    func goCategoryInScore(){
        delegate?.goCategory()
        self.dismiss(animated: false, completion: nil)
    }
    
    //function of ScorePopup_ViewController,  Next: send score and increase SettingPlayerCount. and return to category
    @IBAction func TouchContinue(_ sender: Any) {
        if gameSetting!.settingPlayerCount == gameSetting!.settingPlayer{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let TotalScoreCotroller = storyBoard.instantiateViewController(withIdentifier: "TotalScore") as? TotalScore_ViewController
            TotalScoreCotroller?.totalPlayerScore = gameSetting!.playerScore
            TotalScoreCotroller?.gameSetting = self.gameSetting
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromBottom
            view.window!.layer.add(transition, forKey: kCATransition)
            self.present(TotalScoreCotroller!, animated: false, completion: nil)
        }else{
            self.dismiss(animated: false, completion: nil)
            delegate?.continueGame()
        }
    }
    @IBAction func TouchAnotherCategory(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        delegate?.goCategory()
    }

    func MoreGame(){
        self.dismiss(animated: false, completion: nil)
        delegate?.MoreGameinGameView()
    }
    func GoHome(){
        self.dismiss(animated: false, completion: nil)
        delegate?.GoHomeInGameView()
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
