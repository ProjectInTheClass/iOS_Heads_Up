//
//  Main_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 24/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class Main_ViewController: UIViewController {
    var game = GameController()
//Timer
    @IBOutlet var timerLabel: UILabel!
    var seconds = 5
    var timer = Timer()
    
    @objc func updateTimer(){
        CheckEndDone()
        seconds -= 1
        timerLabel.text = "\(seconds)"
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(Main_ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
//Contents
    @IBOutlet var contentLabel: UILabel!
    @IBAction func correctButton(_ sender: UIButton) {
        game.touchCorrectButton()
        contentLabel.text = game.contentText
    }
    
    @IBAction func passButton(_ sender: Any) {
        game.touchPassButton()
        contentLabel.text = game.contentText

    }
    
    @IBAction func priviousButton(_ sender: Any) {
        game.contentPointer -= 1
        contentLabel.text = game.contentText

    }
    
    
    override func viewDidLoad() { //재정의 할 것이다.
        super.viewDidLoad() //vidwDidLoad : 기존 기능에 덧붙혀서 기능을 추가 할 것이다.
        timerLabel.text = "\(seconds)"
        runTimer()
        contentLabel.text = game.contentText
    }
  


    
    func CheckEndDone() {
        if seconds == 0{
            timerLabel.removeFromSuperview()
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewContorller = storyBoard.instantiateViewController(withIdentifier: "totalScore") as? Score_ViewController
            //         self.dismiss(animated: false, completion: nil)
            nextViewContorller?.totalScore = game.roundScore
            nextViewContorller?.passOrCorrectList = game.passOrCorrectList
            self.present(nextViewContorller!, animated: false, completion: nil)
        }
    }
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? Pass_ViewController{ //vc는 as? @@ 화면에서 갖고있는 인스턴스의 정보를 가지고 있는다. //vc의 type은 viewController
            //as : 기존에 원래 있는 type으로 가져간다.
            vc.passInstance = contentLabel.text
        }
    }
 */

}
