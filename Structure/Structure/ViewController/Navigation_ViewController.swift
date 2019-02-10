//
//  Navigation_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 04/02/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class Navigation_ViewController: UINavigationController {

    var gameSetting : GameSetting? //receive from Initial_ViewController
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    
    
        override func viewDidLoad() {
        super.viewDidLoad()        
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }


}
