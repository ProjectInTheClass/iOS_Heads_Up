//
//  TotalScore_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class TotalScore_ViewController: UIViewController {
    
    var totalPlayerScore : [String : Int]?
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var scoreLabel2: UILabel!
    @IBOutlet var scoreLabel3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "player1 : \(totalPlayerScore?["player1"])"
        scoreLabel2.text = "player2 : \(totalPlayerScore?["player2"])"
        scoreLabel3.text = "player3 : \(totalPlayerScore?["player3"])"


        // Do any additional setup after loading the view.
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
