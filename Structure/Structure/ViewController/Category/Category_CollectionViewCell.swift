//
//  CategoryCollectionViewCell.swift
//  Structure
//
//  Created by 배수정 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class Category_CollectionViewCell: UICollectionViewCell {
    @IBOutlet var categoryTitleLabel: UILabel!

    override var isSelected: Bool {
        didSet {
            if isSelected {
                categoryTitleLabel.textColor = UIColor.white
            }
            else {
                categoryTitleLabel.textColor = UIColor.black
            }
        } }

    
}
