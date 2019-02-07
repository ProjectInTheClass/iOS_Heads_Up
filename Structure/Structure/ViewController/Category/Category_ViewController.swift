//
//  CategoryViewController.swift
//  Structure
//
//  Created by 배수정 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
import Firebase

class Category_ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // var ref : DatabaseReference!
    
    // var numberOfCell : Int = 10
    var gameSetting : GameSetting? //receive from Initial_ViewController
    var gameEnviroment = GameEnviroment()
    // To Do : get allCategory and contents array from Contents().JSON file
    var testContest = Content()
    var cellIdentifier: String = "cell"
    var allCategory: [String] = ["한국영화", "외국영화", "한국드라마", "외국드라마", "K-POP(가수)", "K-POP(제목)", "스카이캐슬", "보헤미안 랩소디", "동물"]
    var contents : [String] = ["명랑","신과함께","국제시장","베테랑","도둑들","7번방의 선물","암살","광해","택시운전사","부산행","AB","BC","CD","ASD","ASD"]
    
    
    //cololectionView Control and show category
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
        cell.delegate = self
        return cell
    }
    
    @IBOutlet var playerNumber: UILabel!
    
    @IBAction func ToucnBackButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func ChangeMotionEnviroment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            gameEnviroment.motionEnviroment = "Touch"
        }
        if sender.selectedSegmentIndex == 1 {
            gameEnviroment.motionEnviroment = "Gyro"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print data from Contents() : Test Code
       // testContest.getdata()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        playerNumber.text = "Player\((gameSetting?.settingPlayerCount)! + 1)"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let startViewController = segue.destination as? Start_ViewController {
            startViewController.gameSetting = self.gameSetting
            startViewController.contents = self.contents
            startViewController.gameEnviroment = self.gameEnviroment
        }
        else if let customViewController = segue.destination as? Add_CustomTheme_ViewController{
            print("Do Custum")
        }
    }
    
    func GetCellTitle(title : String){
        contents = testContest.InitContents(title: title)
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
