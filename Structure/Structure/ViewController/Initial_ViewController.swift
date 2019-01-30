//
//  Initial_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 30/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class Initial_ViewController: UIViewController , SettingTimeAndPlayerDelegateProtocol{
    
let popPlayerAndTimeSetting : SettingTimeAndPlayer_ViewController = UINib(nibName: "SettingTimeAndPlayer", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SettingTimeAndPlayer_ViewController
    @IBAction func anyTab(_ sender: Any) {

        let viewColor = #colorLiteral(red: 0.088717632, green: 0.05267825723, blue: 0.02710740082, alpha: 1)
        popPlayerAndTimeSetting.backgroundColor = viewColor.withAlphaComponent(0.6)
        popPlayerAndTimeSetting.delegate = self
        self.view.addSubview(popPlayerAndTimeSetting)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func ShowNextView(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyBoard.instantiateViewController(withIdentifier: "GameStart") as? Start_ViewController
        self.present(startViewController!, animated: false, completion: nil)
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
