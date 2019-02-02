//
//  TotalScore_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit


class TotalScore_ViewController: UIViewController {
    var gameSetting : GameSetting?
    var totalPlayerScore : [String : Int]?
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var scoreLabel2: UILabel!
    @IBOutlet var scoreLabel3: UILabel!
    
    
    @IBAction func TouchHomeButton(_ sender: Any) {
        
    }
    @IBAction func TouchMoreGame(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "player1 : \(totalPlayerScore?["player1"])"
        scoreLabel2.text = "player2 : \(totalPlayerScore?["player2"])"
        scoreLabel3.text = "player3 : \(totalPlayerScore?["player3"])"


        // Do any additional setup after loading the view.
    }
    



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? Category_ViewController {
            self.gameSetting?.settingPlayerCount = 0
            self.gameSetting?.playerScore = nil
            vc.gameSetting = self.gameSetting
        }
    }
    

}
