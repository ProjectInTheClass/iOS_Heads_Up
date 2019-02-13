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

struct ContentsList : Codable {
    struct Content : Codable {
        let Title : String
        let Words : [String]
    }
    let Contents : [Content]
}


public struct Content
{
    let FullPath = Bundle.main.url(forResource: "Contents", withExtension: "json")
    var contentsList : ContentsList?
    var favoritDictionary : Dictionary<String, Bool> = [String : Bool]()
    
    

    
    var allCategory: [String]?
    
    func InitContents(title : String) -> [String] {
        for listCounter in (contentsList?.Contents.indices)!{
            if contentsList?.Contents[listCounter].Title == title{
                return (contentsList?.Contents[listCounter].Words)!
            }
        }
        return ["해당 컨텐츠가 없습니다"]
    }
    
    init() {
        let jsonString = try? String(contentsOf: FullPath!)
        let data = jsonString?.data(using: .utf8)
        let decoder = JSONDecoder()
        if let data = data, let myContentsList = try? decoder.decode(ContentsList.self, from: data){
            self.contentsList = myContentsList
            for content in (contentsList?.Contents)!{
                if let _ = allCategory {
                    allCategory?.append(content.Title)
                }else{
                    allCategory = [content.Title]
                }
            }
        }else{
            print("Error : 데이터를 불러오는데 실패했습니다.")
        }
    }
    

    
}


