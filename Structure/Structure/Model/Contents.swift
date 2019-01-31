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

struct Content
{
    var name = ""
    var favorite = false
    var identifier : Int
    var contents : [String] = ["명랑","신과함께","국제시장","베테랑","도둑들","7번방의 선물","암살","광해","택시운전사","부산행","@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"]
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int{
        Content.identifierFactory += 1
        return Content.identifierFactory
    }
    mutating func shuffleContent () {
        for shuffleCount in contents.indices {
            let randomValue = Int(arc4random_uniform(UInt32(contents.count)))
            let temp = contents[shuffleCount]
            contents[shuffleCount] = contents[randomValue]
            contents[randomValue] = temp
        }
    }
    
    init(){
        self.identifier = Content.getUniqueIdentifier()
    }
    
}


