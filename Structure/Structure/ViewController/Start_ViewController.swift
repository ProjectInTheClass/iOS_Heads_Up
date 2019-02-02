//
//  Start_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 30/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit


class Start_ViewController: UIViewController, GameDelegateProtocol {
    var gameSetting : GameSetting?
    var contents : [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func TouchBackButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    //function of Game_ViewController, return to Category StoryBoard
    func CreatNewRound() {
        self.dismiss(animated: false, completion: nil)
    }
    
    //send gameSetting and contents Data using segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? Game_ViewController {
            vc.gameSetting = self.gameSetting!
            vc.contents = self.contents
            vc.delegate = self
        }
    }
    
}
