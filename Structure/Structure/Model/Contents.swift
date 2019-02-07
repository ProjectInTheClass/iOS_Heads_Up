//
//  Contents.swift
//  Structure
//
//  Created by 손희덕 on 24/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

// Content에 대한 정보를 관리하는 부분
// Favorit 기능
// Custum으로 생성된 Content를 관리



// 서버와의 연결

import Foundation
import Firebase
import FirebaseFirestore

public struct Content
{
    var index : Int?
    var word : [String]?
    var title : String?
    
    init(index : Int, word: [String], title:String) {
        self.index = index
        self.word = word
        self.title = title
    }
}

    
    /*func shuffleContent () {
        for shuffleCount in contents.indices {
            let randomValue = Int(arc4random_uniform(UInt32(contents.count)))
            let temp = contents[shuffleCount]
            contents[shuffleCount] = contents[randomValue]
            contents[randomValue] = temp
        }
     }
     */



