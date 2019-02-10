//
//  favoriteButton.swift
//  Structure
//
//  Created by 배수정 on 07/02/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class favoriteButton: UIButton {
    
    var isOn : Bool?
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }


    
    func initButton(){
        if isOn == nil {
            isOn = false
        }
        addTarget(self, action: #selector(favoriteButton.buttonPressed), for: .touchUpInside)
    }
    @objc private func buttonPressed(){
        activateButton(bool: !isOn!)
    }
    
    
    func activateButton(bool: Bool){
        
        isOn = bool
        if isOn == true{
            setImage(UIImage(named:"starA"), for: UIControl.State.normal)
        }
        else{
            setImage(UIImage(named: "star"), for: UIControl.State.normal)
        }
    }
    
    
}
