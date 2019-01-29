//
//  Score_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 28/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class Score_ViewController: UIViewController {
    var correctTrueList : [Bool]?
    var answeredList : [String]?
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var passListLabel: UILabel!
    @IBOutlet var correctListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var totalScore = 0
        for scoreCounter in correctTrueList!.indices{
            if correctTrueList![scoreCounter] == true{
                totalScore += 1
            }
        }
        scoreLabel.text = "Score : \(totalScore)"
        
        var correctList : [String]?
        var passList : [String]?
        
        for counter in answeredList!.indices {
            if correctTrueList![counter] == true {
                if let _ = correctList{
                    correctList?.append(answeredList![counter])
                }else{
                    correctList = [answeredList![counter]]
                }
            }
            else{
                if let _ = passList{
                    passList?.append(answeredList![counter])
                }else{
                    passList = [answeredList![counter]]
                }
            }
        }
        passListLabel.text = passList?.joined(separator: " ")
        correctListLabel.text = correctList?.joined(separator: " ")
    }
    
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


