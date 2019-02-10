//
//  CategoryCollectionViewCell.swift
//  Structure
//
//  Created by 배수정 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

protocol UICollectionViewDelegate {
    func GetCellTitle(title : String)
    func SetFavorit (favoritTitle : String)
    func reloadCell(index : IndexPath)
    func selectFromTwoSegue(title : String)
}

class Category_CollectionViewCell: UICollectionViewCell {
    var favoritContent : [String]?
    var delegate : UICollectionViewDelegate?
    var cellIndex : IndexPath?
    @IBOutlet var categoryTitleLabel: UILabel!
    var isOn : Bool = false
    override var isSelected: Bool {
        didSet {
            if isSelected {
                categoryTitleLabel.textColor = UIColor.white
                delegate?.GetCellTitle(title: categoryTitleLabel.text!)
                delegate?.selectFromTwoSegue(title: categoryTitleLabel.text!)
            }
            else {
                categoryTitleLabel.textColor = UIColor.black
            }
        }
    }

    

    
    @IBAction func TouchFavorit(_ sender: UIButton) {
        delegate?.SetFavorit(favoritTitle: categoryTitleLabel.text!)
        if isOn == true{
            favoritButton.setImage(UIImage(named:"starA"), for: UIControl.State.normal)
        }
        else{
            favoritButton.setImage(UIImage(named: "star"), for: UIControl.State.normal)
        }
        delegate?.reloadCell(index : cellIndex!)
    }
    
    @IBOutlet var favoritButton: UIButton!
    
    func CheckButtonImage(){
        if isOn == true{
            favoritButton.setImage(UIImage(named:"starA"), for: UIControl.State.normal)
        }else{
            favoritButton.setImage(UIImage(named: "star"), for: UIControl.State.normal)
        }
    }
    
    
    
    
}
