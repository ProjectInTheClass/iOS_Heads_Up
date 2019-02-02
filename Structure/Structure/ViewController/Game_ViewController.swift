//
//  Game_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 24/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
//Test Commit
protocol GameDelegateProtocol {
    func CreatNewRound()
}

class Game_ViewController: UIViewController , ScorePopupDelegateProtocol {
    var delegate : GameDelegateProtocol?
    var game = GameController()
    var gameSetting = GameSetting()
    // gnuk's Todo : 이전화면에서 컨텐츠에 대한 정보를 넘겨 Main_ViewController의 contents에 입력
    var contents : [String]?
    var playCount : Int?
    var seconds : Int = 60
    var timer = Timer()
    @IBOutlet var timerLabel: UILabel!

    @objc func updateTimer(){
        CheckEndDone()
        seconds -= 1
        timerLabel.text = "\(seconds)"
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(Game_ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    //Contents
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var correctOrPassLabel: UILabel!
    @IBAction func correctButton(_ sender: UIButton) {
        game.touchCorrectButton()
        contentLabel.text = game.contentText
        correctOrPassLabel.text = "Correct"
        correctOrPassLabel.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        correctOrPassLabel.isHidden = false
        let time = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: time){
            self.correctOrPassLabel.isHidden = true
        }
        

    }
    
    @IBAction func passButton(_ sender: Any) {
        game.touchPassButton()
        contentLabel.text = game.contentText
        correctOrPassLabel.text = "Pass"
        correctOrPassLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        correctOrPassLabel.isHidden = false
        let time = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: time){
            self.correctOrPassLabel.isHidden = true
        }
    }
    
    @IBAction func priviousButton(_ sender: Any) {
        game.touchPriviousButton()
        contentLabel.text = game.contentText
        
    }
    
    func CheckEndDone() {
        if seconds == 0{
            timerLabel.removeFromSuperview()
            ShowPopup()
        }

    }
    
    func ResetGame(){
        self.dismiss(animated: false, completion: nil)
    }
    
    func NextGame(){
        gameSetting.settingPlayerCount += 1
        if let _ = gameSetting.playerScore{
            gameSetting.playerScore!["player\(gameSetting.settingPlayerCount)"] = game.roundScore
        }else{
            gameSetting.playerScore = ["player\(gameSetting.settingPlayerCount)" : game.roundScore]
        }
        if gameSetting.settingPlayerCount == gameSetting.settingPlayer{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let TotalScoreCotroller = storyBoard.instantiateViewController(withIdentifier: "TotalScore") as? TotalScore_ViewController
            TotalScoreCotroller?.totalPlayerScore = gameSetting.playerScore
            self.present(TotalScoreCotroller!, animated: false, completion: nil)
        }else{
                self.dismiss(animated: false, completion: nil)
                delegate?.CreatNewRound()
            }
    }
    

    
    func ShowPopup (){
      let popup : ScorePopup_ViewController = UINib(nibName: "scorePopup", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! ScorePopup_ViewController
        let viewColor = #colorLiteral(red: 0.088717632, green: 0.05267825723, blue: 0.02710740082, alpha: 1)
        popup.delegate = self
        popup.backgroundColor = viewColor.withAlphaComponent(0.6)
        game.gameScore()
        popup.correctLabel.text = game.correctList?.joined(separator: "\n")
        popup.correctLabel.adjustsFontSizeToFitWidth = true
        popup.passLabel.text = game.passList?.joined(separator: "\n")
        popup.passLabel.adjustsFontSizeToFitWidth = true
        popup.scoreLabel.text = "Score : \(game.roundScore)"
        popup.scoreLabel.adjustsFontSizeToFitWidth = true
        popup.baseView.backgroundColor = #colorLiteral(red: 0.8777112365, green: 0.7940018773, blue: 0.5124126673, alpha: 1)
        popup.baseView.layer.cornerRadius = 8.0
        if gameSetting.settingPlayer! == gameSetting.settingPlayerCount + 1 {
            popup.nextButton.titleLabel?.text = "Total Score"
        }
        self.view.addSubview(popup)
        }
    
    
    override func viewDidLoad() { //재정의 할 것이다.
        super.viewDidLoad() //vidwDidLoad : 기존 기능에 덧붙혀서 기능을 추가 할 것이다.
        seconds = gameSetting.timeLimit!
        game.contents = self.contents!
        game.shuffleContent()
        timerLabel.text = "\(seconds)"
        runTimer()
        correctOrPassLabel.isHidden = true
        contentLabel.text = game.contentText
        contentLabel.adjustsFontSizeToFitWidth = true
    }
    

    /* gnuk 참고 이전 viewController에서 Game_ViewController로 넘겨줘야 하는 값, 부분
     let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
     let startViewController = storyBoard.instantiateViewController(withIdentifier: "gameStart") as? Game_ViewController
     startViewController?.contents = self.contents //self.contents 는 contents선택 화면에서 선택된 contents[String]
     */
    
    
    
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let vc = segue.destination as? Pass_ViewController{ //vc는 as? @@ 화면에서 갖고있는 인스턴스의 정보를 가지고 있는다. //vc의 type은 viewController
     //as : 기존에 원래 있는 type으로 가져간다.
     vc.passInstance = contentLabel.text
     }
     }
     */
    
}
