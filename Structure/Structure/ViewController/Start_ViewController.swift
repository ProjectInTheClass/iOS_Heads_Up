//
//  Start_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 30/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
import ViewAnimator
import CoreMotion


class Start_ViewController: UIViewController, GameDelegateProtocol {
    var gameSetting : GameSetting?
    var gameEnviroment : GameEnviroment?
    var contents : [String]?
    var seconds = 3
    var timer = Timer()
    var motion = CMMotionManager()
    var GravityBehavior : UIGravityBehavior = {
        let behavior = UIGravityBehavior()
        behavior.magnitude = 0
        return behavior
    }()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if gameEnviroment?.motionEnviroment == "Gyro"{
            if motion.isAccelerometerAvailable{
                GravityBehavior.magnitude = 1.0
                motion.accelerometerUpdateInterval = 1/10
                motion.startAccelerometerUpdates(to: .main) { (data, error) in
                    if let z = data?.acceleration.z {
                        if z >= -0.15 && z <= 0.2{
                            self.ReadyGame()
                            self.motion.stopAccelerometerUpdates()
                            print(z)
                        }
                    }
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        countLabel.isHidden = true
        if gameEnviroment?.motionEnviroment == "Gyro"{
            startButton.isHidden = true
            startButton.isEnabled = false
        }else if gameEnviroment?.motionEnviroment == "Touch"{
            startButton.isHidden = false
            startButton.isEnabled = true
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if gameEnviroment?.motionEnviroment == "Gyro"{
            GravityBehavior.magnitude = 0
            motion.stopAccelerometerUpdates()
        }
    }
    
    @IBOutlet var startButton: UIButton!
    @IBAction func TouchStart(_ sender: Any) {
        ReadyGame()
    }
    
    func ReadyGame() {
        countLabel.isHidden = false
        seconds = 3
        startButton.isHidden = true
        countLabel.text = "\(seconds)"
        runTimer()
        let animation = AnimationType.zoom(scale: 0.01)
        countLabel.animate(animations: [animation], reversed: false, initialAlpha: 1.0, finalAlpha: 1.0, delay: 0.0, duration: 1, options: UIView.AnimationOptions.init(rawValue: 0), completion: nil)
    }
    
    @objc func updateTimer(){
        seconds -= 1
        if seconds == 0{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let GameViewController = storyBoard.instantiateViewController(withIdentifier: "Game") as? Game_ViewController
            GameViewController?.gameSetting = self.gameSetting!
            GameViewController?.contents = self.contents
            GameViewController?.gameEnviroment = self.gameEnviroment
            GameViewController?.delegate = self
            self.present(GameViewController!, animated: false, completion: nil)
            timer.invalidate()
        }else{
            countLabel.text = "\(seconds)"
            let animation = AnimationType.zoom(scale: 0.01)
            countLabel.animate(animations: [animation], reversed: false, initialAlpha: 0, finalAlpha: 1.0, delay: 0.0, duration: 1, options: UIView.AnimationOptions.init(rawValue: 0), completion: nil)
        }
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(Start_ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    @IBOutlet var countLabel: UILabel!
    func MoveToCategory() {
        navigationController?.popViewController(animated: false)
    }
    func GoHomeInStar(){
        navigationController?.popToRootViewController(animated: false)
    }

    
    
}
