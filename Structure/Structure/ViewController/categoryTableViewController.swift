//
//  categoryTableViewController.swift
//  Structure
//
//  Created by 배수정 on 29/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class categoryTableViewController: UITableViewController {

    var allcategory:Array<category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let category1 = category(title: "한국영화", difficulty: 3, favorite: true)
        let category2 = category(title: "외국영화", difficulty: 2, favorite: false)
        let category3 = category(title: "드라마", difficulty: 1, favorite: false)
        
    allcategory = [category1, category2, category3]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let cateArr = allcategory else{
            return 0
            }
        return cateArr.count
        // #warning Incomplete implementation, return the number of rows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        guard let cateArr = allcategory else {
            return cell
        }
        cell.textLabel?.text =
            cateArr[indexPath.row].title
        

        return cell
    }
    
}
// gnuk 참고
/*
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewContorller = storyBoard.instantiateViewController(withIdentifier: "totalScore") as? ㅡㅁ
    //         self.dismiss(animated: false, completion: nil)
    nextViewContorller?.correctTrueList = game.correctTrueList
    nextViewContorller?.answeredList = game.answeredList
*/
