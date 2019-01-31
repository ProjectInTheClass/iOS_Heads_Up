//
//  CategoryViewController.swift
//  Structure
//
//  Created by 배수정 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

class Category_ViewController: UIViewController, UICollectionViewDataSource {
    
    // var numberOfCell : Int = 10
    var gameSetting : GameSetting?
    var cellIdentifier: String = "cell"
    var allCategory: [String] = ["한국영화", "외국영화", "한국드라마", "외국드라마", "K-POP(가수)", "K-POP(제목)", "스카이캐슬", "보헤미안 랩소디", "동물"]
    var contents : [String] = ["명랑","신과함께","국제시장","베테랑","도둑들","7번방의 선물","암살","광해","택시운전사","부산행","AB","BC","CD","ASD","ASD"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return self.numberOfCell
        return self.allCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : Category_CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! Category_CollectionViewCell
        
        let category = self.allCategory[indexPath.item]
        print(indexPath.item)
        
        cell.categoryTitleLabel.text = category
        cell.categoryTitleLabel.adjustsFontSizeToFitWidth = true
        return cell
    }
    
    
// DegegateData with tempButton

    @IBAction func touchTempNext(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyBoard.instantiateViewController(withIdentifier: "GameStart") as? Start_ViewController
        startViewController?.gameSetting = self.gameSetting
        startViewController?.contents = self.contents
        self.present(startViewController!, animated: false, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
