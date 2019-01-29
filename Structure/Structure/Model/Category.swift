//
//  Category.swift
//  Structure
//
//  Created by 배수정 on 29/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import Foundation

class category {
    var title: String
    var difficulty: Int
    var favorite: Bool
    
    init(title:String, difficulty:Int, favorite:Bool)  {
        self.title = title
        self.difficulty = difficulty
        self.favorite = favorite
    }
}
