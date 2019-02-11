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
    
    
    mutating func GetFavoritDictionfary(){
        for listCounter in (contentsList?.Contents.indices)!{
            favoritDictionary[(contentsList?.Contents[listCounter].Title)!] = false
        }
    }
    
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
    
    /*
     init(index : Int, word: [String], title:String) {
     self.index = index
     self.word = word
     self.title = title
     }
     */
    
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
/*
 let newUrl = Bundle.main.url(forResource: "contentsSource2", withExtension: "json")
 /*mutating func getdata() {
 guard let j = newUrl
 else{
 print("data not found")
 return
 }
 
 guard let d = try? Data(contentsOf: j)
 else { print("failed")
 return
 
 }
 
 guard let rootJSON = try? JSONSerialization.jsonObject(with: d, options: []) as! [String : Any]
 else{ print("failedh")
 return
 
 }*/
 
 /*  if let JSON = rootJSON as? [String: Any] {
 
 // (컨텐츠 제목 들어갈 라벨명).text = JSON["name"] as? String
 
 guard let jsonArray = JSON["list"] as? [[String: Any]] else {
 return
 }
 print(jsonArray) // jsonArray에서는
 
 //gnuk's To Do : JSON파일에서 "list"로 부터 받아온 파일이 지금 [[String : Any]] 로 되어있음
 //  [[String : Any]] 을 getContentsData = [String : Any] 로 풀고
 //dictoinary make to Array cods is
 /*
 let getContentsData : [Any]?
 
 print(getContentsData)
 
 //   var anyContents = Array(getContentsData.values) //[String : Any] dictionary를 [Any] array로 변경
 
 //contents = anyContents as? [String] // [Any] Array 를 [String]로 설정
 print(contents)
 */
 }
 }*/
 
 
 
 */

