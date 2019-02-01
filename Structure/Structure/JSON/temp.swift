//
//  temp.swift
//  Structure
//
//  Created by Carson's Macbook Pro on 01/02/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //@IBOutlet weak var (컨텐츠 제목 들어갈 라벨명): UILabel!
    //@IBOutlet weak var (컨텐츠 문제 들어갈 라벨명): UITableView!
    
    
    var contentsList = [ContentsData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* [진혁_작업중] Custom Contents >> JSON
         encoder.outputFormatting = .prettyPrinted
 
        
        if let customJsonData = customJsonData, let jsonString = String(data: customJsonData, encoding: .utf8){
            print(jsonString)
        }
        */
        
        
        let newUrl = Bundle.main.url(forResource: "contentsSource2", withExtension: "json")
        
        guard let j = newUrl
            else{
                print("data not found")
                return
        }
        
        guard let d = try? Data(contentsOf: j)
            else { print("failed")
                return
                
        }
        
        guard let rootJSON = try? JSONSerialization.jsonObject(with: d, options: [])
            else{ print("failedh")
                return
                
        }
        
        if let JSON = rootJSON as? [String: Any] {
            
        // (컨텐츠 제목 들어갈 라벨명).text = JSON["name"] as? String
            
            guard let jsonArray = JSON["list"] as? [[String: Any]] else {
                return
            }
            
            print(jsonArray)
            
            /*  단어 출력할때 참고하세용:)
             
            let name = jsonArray[1]["word"] as? String
            print(name ?? "NA")
             
            */
            
            contentsList = jsonArray.compactMap{return ContentsData($0)}
            
         //   self.(00View).reloadData()
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentContents = contentsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        var StingArray : [String] = [currentContents.word]
        cell.textLabel?.text = currentContents.word
        return cell
    }
    
}


struct ContentsData {
    var word: String
    init(_ dictionary: [String: Any]) {
        self.word = dictionary["word"] as? String ?? "NA"
    }
}


/* [진혁_작업중] Custom Contents >> JSON
struct CustomData : Codable{
    var customName : String
    var favorite : Bool
    var customWord : Array<String>
}

let encoder = JSONEncoder()
let custom1 = CustomData(customName: "iOS틀딱이들", favorite : true, customWord: ["정진혁","박경빈","손희덕","고야","깜찍이"])
let customJsonData = try? encoder.encode(custom1)
 
*/

