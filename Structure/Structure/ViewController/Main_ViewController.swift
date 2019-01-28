//
//  Main_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 24/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class Main_ViewController: UIViewController {
    
//Timer
    @IBOutlet var timerLabel: UILabel!
    var seconds = 30
    var timer = Timer()
    var isTimerRunning = false
    
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
    var content : [String] = ["명랑","신과함께","국제시장","베테랑","도둑들","7번방의 선물","암살","광해","택시운전사","부산행"]
    var contentPointer : Int = 0 {
        didSet {
            CheckEndDone()
        }
    }
    var passList : [String]?
    var correctList : [String]?
    var roundScore = 0
    @IBAction func correctButton(_ sender: UIButton) {
        correctList?.append(content[contentPointer])
        roundScore += 1
        contentPointer += 1
    }
    
    @IBAction func passButton(_ sender: Any) {
        passList?.append(content[contentPointer])
        contentPointer += 1
    }
    
    @IBAction func priviousButton(_ sender: Any) {
        contentPointer -= 1
        contentLabel.text = content[contentPointer]

    }
    
    
    override func viewDidLoad() { //재정의 할 것이다.
        super.viewDidLoad() //vidwDidLoad : 기존 기능에 덧붙혀서 기능을 추가 할 것이다.
        shuffleContent()
        timerLabel.text = "\(seconds)"
        runTimer()
        contentLabel.text = content[contentPointer]
        
    }
  


    
    func CheckEndDone() {
        if contentPointer == content.count || seconds == 0{
            contentLabel.text = "Score : \(roundScore)" //화면전환
            timerLabel.removeFromSuperview()
            let time = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: time){
                self.dismiss(animated: false, completion: nil)
            }
            
        }else{
            contentLabel.text = content[contentPointer]
        }
    }
    
    func shuffleContent () {
        for shuffleCount in content.indices{
            let randomValue = Int(arc4random_uniform(UInt32(content.count)))
            let temp = content[shuffleCount]
            content[shuffleCount] = content[randomValue]
            content[randomValue] = temp
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
