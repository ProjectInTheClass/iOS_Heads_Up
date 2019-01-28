//
//  Pass_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 27/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class Pass_ViewController: UIViewController {
    //var passInstance : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let time = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: time){
            self.dismiss(animated: false, completion: nil)
        }
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
