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
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int{
        Content.identifierFactory += 1
        return Content.identifierFactory
    }
    
    init(){
        self.identifier = Content.getUniqueIdentifier()
    }
}


