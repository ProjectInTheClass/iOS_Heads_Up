//
//  Score_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 28/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class Score_ViewController: UIViewController {
    var totalScore : Int = 0
    var passList : [String]?
    var correctList : [String]?
    var passOrCorrectList : [String : String]?
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var passListLabel: UILabel!
    @IBOutlet var correctListLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score : \(totalScore)"
        correctListLabel.text = passOrCorrectList?["Correct"]
        passListLabel.text = passOrCorrectList?["Pass"]

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
