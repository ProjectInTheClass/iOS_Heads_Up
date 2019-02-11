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


public class Custom
{
    //  let FullPath = "/Users/hduck/Desktop/iOS_Heads_Up/Structure/Structure/JSON/Custom.json"
    var customList : CustomList?
    
    var customCategory: [String]?
    
    func InitContents(title : String) -> [String] {
        if let customContent = UserDefaults.standard.array(forKey: title) as? [String]{
            return customContent
        }else{
            return ["해당컨텐츠가 없습니다"]
        }
    }
    
    init() {
        if let userCustom = UserDefaults.standard.array(forKey: "CustomList") as? [String]{
            customCategory = userCustom
        }
    }
    
    func MakeCustomData (Title : String, Words : [String]){
        UserDefaults.standard.set(Words, forKey: "\(Title)")
        
        if let _ = customCategory{
            customCategory! = [Title] + customCategory!
        }else{
            customCategory = [Title]
        }
        UserDefaults.standard.set(customCategory, forKey : "CustomList")
    }
    
    func DeleteCustomCategory(title : String){
        UserDefaults.standard.removeObject(forKey: title)
        if var deleteCategory = customCategory{
            var removeindex : Int?
            for counter in deleteCategory.indices{
                if deleteCategory[counter] == title{
                    removeindex = counter
                }
            }
            if let _ = removeindex{
                deleteCategory.remove(at: removeindex!)
                customCategory = deleteCategory
                UserDefaults.standard.set(customCategory, forKey : "CustomList")
            }else{
                print("삭제하는데 실패했습니다.")
            }
        }
    }
}
