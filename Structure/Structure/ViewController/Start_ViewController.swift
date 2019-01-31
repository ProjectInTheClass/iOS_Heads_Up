//
//  Start_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 30/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit


class Start_ViewController: UIViewController {
    var gameSetting : GameSetting?    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func changeSetting(){
        
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? Game_ViewController {
            print(gameSetting)
            vc.gameSetting = self.gameSetting!
        }
    
    }
}
