//
//  ScorePopup_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 30/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

protocol ScorePopupDelegateProtocol {
    func ResetGame()
    func NextGame()
}


class ScorePopup_ViewController: UIView {
    
    var delegate: ScorePopupDelegateProtocol?
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var passLabel: UILabel!
    @IBOutlet var baseView: UIView!
    @IBOutlet var nextGameButton: UIButton!
    @IBAction func touchReset(_ sender: Any) {
        delegate?.ResetGame()
    }
    
    @IBAction func touchNextGame(_ sender: Any) {
        delegate?.NextGame()
    }
    
}
