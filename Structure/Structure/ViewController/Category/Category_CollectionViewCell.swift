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
}

class Category_CollectionViewCell: UICollectionViewCell {
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
        } }

    
}
