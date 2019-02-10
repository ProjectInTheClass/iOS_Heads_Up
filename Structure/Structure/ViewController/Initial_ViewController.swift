//
//  Initial_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 30/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
import ViewAnimator

class Initial_ViewController: UIViewController , SettingTimeAndPlayerDelegateProtocol{
    
    var gameSetting : GameSetting?

    //Player and TimeLimit PopUp
    let popPlayerAndTimeSetting : SettingTimeAndPlayer_ViewController = UINib(nibName: "SettingTimeAndPlayer", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SettingTimeAndPlayer_ViewController
    
    @IBAction func anyTab(_ sender: Any) {
        let viewColor = #colorLiteral(red: 0.088717632, green: 0.05267825723, blue: 0.02710740082, alpha: 1)
        popPlayerAndTimeSetting.backgroundColor = viewColor.withAlphaComponent(0.6)
        popPlayerAndTimeSetting.delegate = self
        self.view.addSubview(popPlayerAndTimeSetting)
        let animation = AnimationType.zoom(scale: 0.2)
        popPlayerAndTimeSetting.view.animate(animations: [animation])
        popPlayerAndTimeSetting.frame = self.view.frame


    }

    //function of SettingTimeAndPlayer_ViewController, present CategoryController and send gameSetting data
    func ShowNextView(){
        self.gameSetting=popPlayerAndTimeSetting.gameSetting
        popPlayerAndTimeSetting.removeFromSuperview()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let CategoryViewController = storyBoard.instantiateViewController(withIdentifier: "Category") as? Category_ViewController
        CategoryViewController!.gameSetting = self.gameSetting
        self.navigationController?.pushViewController(CategoryViewController!, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
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
