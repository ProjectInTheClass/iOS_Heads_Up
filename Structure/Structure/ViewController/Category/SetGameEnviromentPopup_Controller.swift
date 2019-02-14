//
//  SetGameEnviromentPopup_Controller.swift
//  Structure
//
//  Created by 손희덕 on 09/02/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

protocol EnviromentDelegateProtocol {
    func ChangeMotionEnviroment(index : Int )
}

class SetGameEnviromentPopup_Controller: UIView {
    var delegate : EnviromentDelegateProtocol?
    
    @IBOutlet var motionButton: UIButton!
    @IBOutlet var touchButton: UIButton!
    @IBOutlet var view: UIView!
    @IBAction func closeButton(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBAction func SettingTouch(_ sender: Any) {
        delegate?.ChangeMotionEnviroment(index: 0)
    }
    
    @IBAction func SettingMotion(_ sender: Any) {
        delegate?.ChangeMotionEnviroment(index: 1)
    }
    
}






