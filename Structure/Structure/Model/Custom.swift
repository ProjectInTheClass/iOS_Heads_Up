//
//  custom.swift
//  Structure
//
//  Created by 손희덕 on 24/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

// custom Content를 생성
// 사용자의 입력을 받는 부분
// 데이터를 Contents로 넘겨주는 부분


import Foundation

struct CustomList : Codable {
    struct Content : Codable {
        let Title : String
        let Words : [String]
    }
    var Custom : [Content]
}


public struct Custom
{
  //  let FullPath = "/Users/hduck/Desktop/iOS_Heads_Up/Structure/Structure/JSON/Custom.json"
    var customList : CustomList?
    var favoritDictionary : Dictionary<String, Bool> = [String : Bool]()
    
    
    mutating func GetFavoritDictionfary(){
        for listCounter in (customList?.Custom.indices)!{
            favoritDictionary[(customList?.Custom[listCounter].Title)!] = false
        }
    }
    
    var customCategory: [String]?
    
    func InitContents(title : String) -> [String] {
        if let customContent = UserDefaults.standard.array(forKey: title) as? [String]{
            return customContent
        }else{
            return ["해당컨텐츠가 없습니다"]
        }
        /*
        for listCounter in (customList?.Custom.indices)!{
            if customList?.Custom[listCounter].Title == title{
                return (customList?.Custom[listCounter].Words)!
            }
        }
        return ["해당 컨텐츠가 없습니다"]*/
    }
    
    init() {
        if let userCustom = UserDefaults.standard.array(forKey: "CustomList") as? [String]{
                customCategory = userCustom
        }
        /*
        let jsonData = try? String(contentsOfFile: FullPath)
        let data = jsonData?.data(using: .utf8)
        let decoder = JSONDecoder()
        if let data = data, let myCustomList = try? decoder.decode(CustomList.self, from: data){
            self.customList = myCustomList
            for custom in (customList?.Custom)!{
                customCategory.append(custom.Title)
            }
        }else{
            print("데이터를 불러오는데 실패했습니다.")
        }
        */
    }
    
    mutating func MakeCustomData (Title : String, Words : [String]){
        /*
        let newCustom = CustomList.Content(Title: Title, Words: Words)
        self.customList?.Custom.append(newCustom)
        let encoder = JSONEncoder()
        let jsonData = try? encoder.encode(newCustom)
         */
        UserDefaults.standard.set(Words, forKey: "\(Title)")
        if let _ = customCategory{
            customCategory?.insert(Title, at: 0)
        }else{
            customCategory = [Title]
        }
        UserDefaults.standard.set(customCategory, forKey : "CustomList")
    }
}
