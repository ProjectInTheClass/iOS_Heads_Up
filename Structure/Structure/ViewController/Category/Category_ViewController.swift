//
//  CategoryViewController.swift
//  Structure
//
//  Created by 배수정 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
import Firebase
import ViewAnimator

class Category_ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,EnviromentDelegateProtocol {
    
    // var ref : DatabaseReference!
    
    // var numberOfCell : Int = 10

    var gameSetting : GameSetting? //receive from Initial_ViewController
    var gameEnviroment = GameEnviroment()
    // To Do : get allCategory and contents array from Contents().JSON file
    var gameContent = Content()
    var category : [String] = ["컨텐츠가 없습니다."]
    var cellIdentifier: String = "cell"
    var allCategory: [String] = ["컨텐츠가 없습니다."]
    var favoritCategory : [String]?
    var contents = ["컨텐츠가 없습니다."]
    var favoritDictionary : Dictionary<String, Bool> = [String : Bool]()

    
    //cololectionView Control and show category
    
    @IBAction func AllCategory(_ sender: UIButton) {
        category = allCategory
        favoritCategory = nil
        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    @IBAction func FavoritCategory(_ sender: Any) {
        for listcategory in category{
            if favoritDictionary[listcategory] == true{
                if let _ = favoritCategory{
                    if favoritCategory?.contains(listcategory) == false {
                        favoritCategory?.append(listcategory)
                    }
                }else{
                    favoritCategory = [listcategory]
                }
            }
        }
        if let _ = favoritCategory {
            category = favoritCategory!
            collectionView.reloadData()
        }else{
            let alert = UIAlertController(title: "선호하는 항목이 없습니다", message: "추가하십시오", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
                self.present(alert, animated: true, completion: nil)
            
        }
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return self.numberOfCell
        return self.category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : Category_CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! Category_CollectionViewCell
        let category = self.category[indexPath.item]
        print(indexPath.item)
        cell.cellIndex = indexPath
        cell.categoryTitleLabel.text = category
        cell.categoryTitleLabel.adjustsFontSizeToFitWidth = true
        cell.delegate = self
        if let isOn = favoritDictionary[category]{
            cell.isOn = isOn
        }else{
            cell.isOn = false
        }
        cell.CheckButtonImage()
        let animation = AnimationType.from(direction: .top, offset: 30)
        cell.animate(animations: [animation], reversed: false, initialAlpha: 0, finalAlpha: 1.0, delay: 0.0, duration: 0.8, options: UIView.AnimationOptions.init(rawValue: 0), completion: nil)
        return cell
    }
    func reloadCell(index : IndexPath){
        collectionView.reloadItems(at: [index])
    }

    
    @IBOutlet var playerNumber: UILabel!
    
    @IBAction func ToucnBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
     let popSetGameEnviroment : SetGameEnviromentPopup_Controller = UINib(nibName: "SetGameEnviroment", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SetGameEnviromentPopup_Controller

    @IBAction func PopupGameMode(_ sender: Any) {
        let viewColor = #colorLiteral(red: 0.088717632, green: 0.05267825723, blue: 0.02710740082, alpha: 1)
        popSetGameEnviroment.backgroundColor = viewColor.withAlphaComponent(0.6)
        popSetGameEnviroment.delegate = self
        self.view.addSubview(popSetGameEnviroment)
        let animation = AnimationType.zoom(scale: 0.2)
        popSetGameEnviroment.view.animate(animations: [animation])
        popSetGameEnviroment.frame = self.view.frame
    }
    

    func ChangeMotionEnviroment(index : Int ){
        if index == 0 {
            gameEnviroment.motionEnviroment = "Touch"
        }
        if index == 1 {
            gameEnviroment.motionEnviroment = "Gyro"
        }
        let time = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: time){
            self.popSetGameEnviroment.removeFromSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allCategory = gameContent.allCategory!
        favoritDictionary = gameContent.favoritDictionary
        category = allCategory
        //print data from Contents() : Test Code
       // gameContent.getdata()
        // Do any additional setup after loading the view.
        if let defaultFavoritDictionary = UserDefaults.standard.dictionary(forKey: "favoritDictionary"){
             favoritDictionary =  defaultFavoritDictionary as! Dictionary<String, Bool>
        }
        if let defaltMotionEnviroment = UserDefaults.standard.string(forKey: "motionEnviroment"){
            gameEnviroment.motionEnviroment = defaltMotionEnviroment
        }else{
            gameEnviroment.motionEnviroment = "Touch"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        playerNumber.text = "Player\((gameSetting?.settingPlayerCount)! + 1)"
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        UserDefaults.standard.set(favoritDictionary, forKey: "favoritDictionary")
        UserDefaults.standard.set(gameEnviroment.motionEnviroment, forKey: "motionEnviroment")

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let startViewController = segue.destination as? Start_ViewController {
            startViewController.gameSetting = self.gameSetting
            startViewController.contents = self.contents
            startViewController.gameEnviroment = self.gameEnviroment
        }
    }
    
    func GetCellTitle(title : String){
        contents = gameContent.InitContents(title: title)
    }
    
    func SetFavorit (favoritTitle : String){
        if favoritDictionary[favoritTitle] == true{
            favoritDictionary[favoritTitle] = false
            print("Set Unfavorit")
            print(favoritDictionary)
        }else {
            favoritDictionary[favoritTitle] = true
            print("Set Favorit")
            print(favoritDictionary)
        }
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
