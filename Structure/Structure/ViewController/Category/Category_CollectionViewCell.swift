//
//  CategoryCollectionViewCell.swift
//  Structure
//
//  Created by 배수정 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

var favoritButton = favoriteButton()
protocol UICollectionViewDelegate {
    func GetCellTitle(title : String)
    func SetFavorit (favoritTitle : String)
}

class Category_CollectionViewCell: UICollectionViewCell {
    var favoritContent : [String]?
    var delegate : UICollectionViewDelegate?
    @IBOutlet var categoryTitleLabel: UILabel!

    override var isSelected: Bool {
        didSet {
            if isSelected {
                categoryTitleLabel.textColor = UIColor.white
                delegate?.GetCellTitle(title: categoryTitleLabel.text!)
            }
            else {
                categoryTitleLabel.textColor = UIColor.black
            }
        }
    }
    
    
    @IBAction func favorit(_ sender: Any) {
        delegate?.SetFavorit(favoritTitle: categoryTitleLabel.text!)
    }
    
    

    
}
