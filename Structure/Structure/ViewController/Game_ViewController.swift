//
//  Game_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 24/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
import CoreMotion
import ViewAnimator


class Game_ViewController: UIViewController {
    var actionGyro : Bool?
    var game = GameController()
    var gameEnviroment : GameEnviroment?

    //receive from Start view
    var gameSetting = GameSetting()
    var contents : [String]?
    
    var seconds : Int = 60 // init from gameSetting.timeLimit
    
    
    
    var motion = CMMotionManager()
    var GravityBehavior : UIGravityBehavior = {
        let behavior = UIGravityBehavior()
        behavior.magnitude = 0
        return behavior
    }()
    
    //Timer
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
    
    
    
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var correctOrPassLabel: UILabel!
    @IBOutlet var passButton: UIButton!
    @IBOutlet var correctButton: UIButton!
    @IBOutlet var priviousButton: UIButton!
    
    //action of each button
    @IBAction func correctButton(_ sender: UIButton) {
        game.touchCorrectButton()
        contentLabel.text = game.contentText
        correctOrPassLabel.text = "Correct"
        correctOrPassLabel.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        correctOrPassLabel.isHidden = false
        correctButton.isEnabled = false
        passButton.isEnabled = false
        let time = DispatchTime.now() + .milliseconds(300)
        DispatchQueue.main.asyncAfter(deadline: time){
            self.correctOrPassLabel.isHidden = true
            self.correctButton.isEnabled = true
            self.passButton.isEnabled = true
            self.priviousButton.isEnabled = true
            self.priviousButton.isHidden = false
        }
    }
    
    
    @IBAction func passButton(_ sender: Any) {
        game.touchPassButton()
        contentLabel.text = game.contentText
        correctOrPassLabel.text = "Pass"
        correctOrPassLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        correctOrPassLabel.isHidden = false
        correctButton.isEnabled = false
        passButton.isEnabled = false
        let time = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: time){
            self.correctOrPassLabel.isHidden = true
            self.correctButton.isEnabled = true
            self.passButton.isEnabled = true
            self.priviousButton.isEnabled = true
            self.priviousButton.isHidden = false
        }
    }
    
    
    
    @IBAction func priviousButton(_ sender: Any) {
        game.touchPriviousButton()
        contentLabel.text = game.contentText
        if game.contentPointer == 0{
            self.priviousButton.isEnabled = false
            self.priviousButton.isHidden = true
        }else{
            self.priviousButton.isEnabled = true
            self.priviousButton.isHidden = false
        }
        
    }
    
    @IBAction func TouchBackButton(_ sender: Any) {
        navigationController!.popToViewController(navigationController!.viewControllers[2], animated: true)
        

    }
    
    
    //Check End Game called on updateTimer
    func CheckEndDone() {
        if seconds == 0{
            timerLabel.removeFromSuperview()
            self.GravityBehavior.magnitude = 0
            self.actionGyro = false
            performSegue(withIdentifier: "Score", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ScoreViewController = segue.destination as? Score_ViewController {
            ScoreViewController.game = self.game
            ScoreViewController.gameSetting = self.gameSetting
        }
    }
    
    //ScorePopup_ViewController Setting(score, passLabel, correctLabel)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if gameEnviroment?.motionEnviroment == "Gyro" && actionGyro == true{
            if motion.isAccelerometerAvailable{
                GravityBehavior.magnitude = 1.0
                motion.accelerometerUpdateInterval = 1/10
                motion.startAccelerometerUpdates(to: .main) { (data, error) in
                    if let z = data?.acceleration.z , self.seconds >= 0{
                        if z <= -0.9 && z >= -1.4 && self.actionGyro == true {
                            self.GravityBehavior.magnitude = 0
                            self.actionGyro = false
                            self.game.touchPassButton()
                            self.correctOrPassLabel.text = "Pass"
                            self.correctOrPassLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                            self.correctOrPassLabel.isHidden = false
                            self.contentLabel.text = self.game.contentText
                            print(z)
                        }
                        if z >= 0.9 && z <= 1.4 && self.actionGyro == true {
                            self.GravityBehavior.magnitude = 0
                            self.actionGyro = false
                            self.game.touchCorrectButton()
                            self.correctOrPassLabel.text = "Correct"
                            self.correctOrPassLabel.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
                            self.correctOrPassLabel.isHidden = false
                            self.contentLabel.text = self.game.contentText
                            print(z)
                        }
                        if z >= -0.25 && z <= 0.2 && self.actionGyro == false {
                            self.correctOrPassLabel.isHidden = true
                            self.actionGyro = true
                            self.GravityBehavior.magnitude = 1.0
                            self.priviousButton.isEnabled = true
                            self.priviousButton.isHidden = false
                            print(z)
                        }
                    }
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if gameEnviroment?.motionEnviroment == "Gyro"{
            GravityBehavior.magnitude = 0
            motion.stopAccelerometerUpdates()
        }
    }
    
    override func viewDidLoad() { //재정의 할 것이다.
        super.viewDidLoad() //vidwDidLoad : 기존 기능에 덧붙혀서 기능을 추가 할 것이다.
        seconds = gameSetting.timeLimit
        seconds = 2
        game.contents = self.contents!
        game.shuffleContent()
        timerLabel.text = "\(seconds)"
        runTimer()
        correctOrPassLabel.isHidden = true
        contentLabel.text = game.contentText
        contentLabel.adjustsFontSizeToFitWidth = true
        self.priviousButton.isEnabled = false
        self.priviousButton.isHidden = true
        
        if gameEnviroment?.motionEnviroment == "Gyro" {
            correctButton.isEnabled = false
            passButton.isEnabled = false
            actionGyro = true
        }else{
            correctButton.isEnabled = true
            passButton.isEnabled = true
            actionGyro = false
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        let animation = AnimationType.zoom(scale: 0.01)
        contentLabel.animate(animations: [animation], reversed: false, initialAlpha: 0, finalAlpha: 1.0, delay: 0.0, duration: 0.5, options: UIView.AnimationOptions.init(rawValue: 0), completion: nil)
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
