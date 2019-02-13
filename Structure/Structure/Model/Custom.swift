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

class CustomContent : NSObject, NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.Title, forKey: "Title")
        aCoder.encode(self.Words, forKey: "Words")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.Title = aDecoder.decodeObject(forKey: "Title") as! String
        self.Words = aDecoder.decodeObject(forKey: "Words") as! [String]
    }
    
    let Title : String
    let Words : [String]
    
    
    init(Title : String , Words : [String]) {
        self.Title = Title
        self.Words = Words
    }
}




public class Custom
{
    
    
    //  let FullPath = "/Users/hduck/Desktop/iOS_Heads_Up/Structure/Structure/JSON/Custom.json"
    
    var customCategory: [String]?
    var customContents : [CustomContent]?
    
    init() {
        customContents = loadCustonContents()
        if let customList = customContents {
            for contents in customList{
                if let _ = customCategory{
                    customCategory?.append(contents.Title)
                }else{
                    customCategory = [contents.Title]
                }
            }
        }
    }
    
    func getDocumentDirt() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return path[0]
    }
    
    func saveCustomContents(customContents : [CustomContent]){
        let documentPath = getDocumentDirt().appendingPathComponent("customContent.arr")
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: customContents, requiringSecureCoding: false)
            try data.write(to : documentPath)
        } catch{
            print("Error!")
        }
    }
    
    func deleteCustomContents(index : Int){
        let documentPath = getDocumentDirt().appendingPathComponent("customContent.arr")
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: customContents!, requiringSecureCoding: false)
            try data.write(to : documentPath)
        } catch{
            print("Error!")
        }
    }
    
    func MakeCustomData (Title : String, Words : [String]){
        let newCustomContent = CustomContent(Title: Title, Words: Words)
        if let _ = customCategory{
            customCategory = [newCustomContent.Title] + customCategory!
            customContents = [newCustomContent] + customContents!
            saveCustomContents(customContents: customContents!)
        }else{
            customContents = [newCustomContent]
            customCategory = [newCustomContent.Title]
            saveCustomContents(customContents: [newCustomContent])
        }
    }
    
    
    func InitContents(title : String) -> [String] {
        if let customContentsData = customContents{
            for contents in customContentsData{
                if contents.Title == title{
                    return contents.Words
                }
            }
        }
        return ["해당 컨텐츠가 없습니다"]
    }
    
    
    func loadCustonContents() -> [CustomContent]? {
        let documentPath = getDocumentDirt().appendingPathComponent("customContent.arr")
        
        do {
            let data = try Data(contentsOf: documentPath)
            if let customContentsData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CustomContent]{
                return customContentsData
            }
        } catch {
            let fileManager = FileManager()
            let nilCustomContent : [CustomContent] = []
            do{
                let data = try NSKeyedArchiver.archivedData(withRootObject: nilCustomContent, requiringSecureCoding: false )
                fileManager.createFile(atPath: documentPath.path, contents: data, attributes: nil)
            }catch{
                print("error")        }
        }
        return nil
    }
    
    
    func DeleteCustomCategory(title : String){
        if let _ = customContents{
            if let _ = customCategory{
                var content = 0
                var category =  0
                for contentCount in 0 ... customContents!.count - 1{
                    if customContents![content].Title == title{
                        content = contentCount
                    }
                }
                customContents?.remove(at: content)
                for categoryCount in 0 ... customCategory!.count - 1{
                    if customCategory![categoryCount] == title{
                        category = categoryCount
                    }
                }
                customCategory?.remove(at: category)
            }
        }
        if let _ = customContents{
            saveCustomContents(customContents: customContents! )
        }else{
            saveCustomContents(customContents: [])
        }
        
    }
    
    
    
    
}

