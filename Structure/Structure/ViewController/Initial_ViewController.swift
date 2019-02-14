//
//  Initial_ViewController.swift
//  Structure
//
//  Created by 손희덕 on 30/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
import ViewAnimator
import ValueStepper

class Initial_ViewController: UIViewController {
    
    var gameSetting = GameSetting()

    @IBOutlet var labelTime: UILabel!
    @IBOutlet var labelPlayer: UILabel!
    override func viewDidLoad() {
        labelTime.text = NSLocalizedString("Time", comment: "")
        labelPlayer.text = NSLocalizedString("Player", comment: "")

        super.viewDidLoad()
        
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Landing.png")!)
       //let appDomain = Bundle.main.bundleIdentifier
       //UserDefaults.standard.removePersistentDomain(forName: appDomain!)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func PlayeyStepper(_ sender: ValueStepper) {
        gameSetting.settingPlayer = Int(sender.value)
    }
    
    @IBAction func TimeLimitStepper(_ sender: ValueStepper) {
        gameSetting.timeLimit = Int(sender.value)
    }
    
    @IBAction func ClickStartButton(_ sender: Any) {
        performSegue(withIdentifier: "category", sender: nil)
        gameSetting.settingPlayerCount = 0
        gameSetting.playerScore?.removeAll()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let CategoryViewController = segue.destination as? Category_ViewController {
            CategoryViewController.gameSetting = self.gameSetting
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

}
