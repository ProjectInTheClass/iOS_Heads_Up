//
//  CategoryViewController.swift
//  Structure
//
//  Created by 배수정 on 31/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
import ViewAnimator

class Category_ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,EnviromentDelegateProtocol ,addDelegateProtocol {
    
    @IBOutlet var buttonAll: UIButton!
    @IBOutlet var buttonFavorit: UIButton!
    @IBOutlet var buttonCategory: UIButton!
    @IBOutlet var labelSelectGame: UILabel!
    
    // var numberOfCell : Int = 10
    
    var gameSetting : GameSetting? //receive from Initial_ViewController
    var gameEnviroment = GameEnviroment()
    // To Do : get allCategory and contents array from Contents().JSON file
    var gameContent = Content()
    var customContent = Custom()
    var category : [String] = ["컨텐츠가 없습니다."]
    var cellIdentifier: String = "cell"
    var allCategory: [String] = ["컨텐츠가 없습니다."]
    var favoritCategory : [String]?
    var contents = ["컨텐츠가 없습니다."]
    var favoritDictionary : Dictionary<String, Bool> = [String : Bool]()
    var customMode = false
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var playerNumber: UILabel!
    
    @IBAction func ToucnBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return self.numberOfCell
        return self.category.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : Category_CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! Category_CollectionViewCell
        let category = self.category[indexPath.item]
        cell.layer.backgroundColor = #colorLiteral(red: 0.9581267238, green: 0.7396259904, blue: 0.4966012239, alpha: 1)
        cell.layer.cornerRadius=10
        let width = (collectionView.frame.size.width - 40) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        cell.favoritButton.frame = CGRect(x: width - 40, y: 0, width: 40, height: 40)
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
        cell.DeleteCustom(customMode : customMode)
        
        let animation = AnimationType.from(direction: .top, offset: 30)
        cell.animate(animations: [animation], reversed: false, initialAlpha: 0, finalAlpha: 1.0, delay: 0.0, duration: 0.8, options: UIView.AnimationOptions.init(rawValue: 0), completion: nil)
        return cell
    }
    func reloadCell(index : IndexPath){
        collectionView.reloadItems(at: [index])
    }
    
    @IBAction func AllCategory(_ sender: UIButton) {
        category = allCategory
        customMode = false
        collectionView.reloadData()
    }
    
    
    
    @IBAction func FavoritCategory(_ sender: Any) {
        favoritCategory = nil
        customMode = false
        if let tempCategory = customContent.customCategory{
            for listcategory in allCategory + tempCategory{
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
        }else{
            for listcategory in allCategory{
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
        }
        
        if let _ = favoritCategory {
            category = favoritCategory!
            collectionView.reloadData()
        }else{
            let alert = UIAlertController(title: NSLocalizedString("No Item", comment: ""), message: NSLocalizedString("Add Favorites", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func CustumCategory(_ sender: UIButton) {
        customMode = true
        if let userCustom = customContent.customCategory{
            category = ["추가하기"] + userCustom
        }else{
            category = ["추가하기"]
        }
        favoritCategory = nil
        collectionView.reloadData()
        
    }
    
    
    
    let popSetGameEnviroment : SetGameEnviromentPopup_Controller = UINib(nibName: "SetGameEnviroment", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SetGameEnviromentPopup_Controller
    

    @IBAction func PopupGameMode(_ sender: Any) {
        let viewColor = #colorLiteral(red: 0.088717632, green: 0.05267825723, blue: 0.02710740082, alpha: 1)
        popSetGameEnviroment.backgroundColor = viewColor.withAlphaComponent(0.6)
        popSetGameEnviroment.delegate = self
        popSetGameEnviroment.labelInterFace.text = NSLocalizedString("Interface", comment: "")
        popSetGameEnviroment.view.layer.cornerRadius = 30.0
        self.view.addSubview(popSetGameEnviroment)
        if gameEnviroment.motionEnviroment == "Touch"{
            popSetGameEnviroment.touchButton.setImage(UIImage(named: "MotionTouchTrue"), for: .normal)
            popSetGameEnviroment.motionButton.setImage(UIImage(named: "MotionGyroFalse"), for: .normal)
        }else if gameEnviroment.motionEnviroment == "Gyro" {
            popSetGameEnviroment.touchButton.setImage(UIImage(named: "MotionTouchFalse"), for: .normal)
            popSetGameEnviroment.motionButton.setImage(UIImage(named: "MotionGyroTrue"), for: .normal)
        }
        let animation = AnimationType.zoom(scale: 0.2)
        popSetGameEnviroment.view.animate(animations: [animation])
        popSetGameEnviroment.frame = self.view.frame
    }
    
    
    
    
    func ChangeMotionEnviroment(index : Int ){
        if index == 0 {
            gameEnviroment.motionEnviroment = "Touch"
            popSetGameEnviroment.touchButton.setImage(UIImage(named: "MotionTouchTrue"), for: .normal)
            popSetGameEnviroment.motionButton.setImage(UIImage(named: "MotionGyroFalse"), for: .normal)
        }
        if index == 1 {
            gameEnviroment.motionEnviroment = "Gyro"
            popSetGameEnviroment.touchButton.setImage(UIImage(named: "MotionTouchFalse"), for: .normal)
            popSetGameEnviroment.motionButton.setImage(UIImage(named: "MotionGyroTrue"), for: .normal)
        }
        UserDefaults.standard.set(gameEnviroment.motionEnviroment, forKey: "motionEnviroment")
        let time = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: time){
            UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: {
                self.popSetGameEnviroment.removeFromSuperview()
            }, completion: nil)
        }
    }
    
    @IBOutlet weak var makeCornerRound3: UIView!
    @IBOutlet weak var makeCornerRound2: UIView!
    @IBOutlet weak var makeCornerRound: UIView!
    override func viewDidLoad() {
        labelSelectGame.text = NSLocalizedString("Category", comment: "")
        buttonAll.setTitle(NSLocalizedString("All", comment: ""), for: .normal)
        buttonFavorit.setTitle(NSLocalizedString("Favorites", comment: ""), for: .normal)
        buttonCategory.setTitle(NSLocalizedString("Custom", comment: ""), for: .normal)
        super.viewDidLoad()
        makeCornerRound2.layer.cornerRadius = 10.0
        makeCornerRound3.layer.cornerRadius = 10.0
        allCategory = gameContent.allCategory!
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
        collectionView.reloadData()
        playerNumber.text = "\(NSLocalizedString("Player", comment: ""))\((gameSetting?.settingPlayerCount)! + 1)"
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let startViewController = segue.destination as? Start_ViewController {
            startViewController.gameSetting = self.gameSetting
            startViewController.contents = self.contents
            startViewController.gameEnviroment = self.gameEnviroment
        } else if let addCustumController = segue.destination as? Add_CustomTheme_ViewController{
            addCustumController.customContent = self.customContent
            addCustumController.delegate = self
        }
    }
    
    func selectFromTwoSegue(title : String){
        if title == "추가하기"{
            performSegue(withIdentifier: "custumSegue", sender: nil)
        }else{
            performSegue(withIdentifier: "startSegue", sender: nil)
            
        }
    }
    
    
    func GetCellTitle(title : String){
        if title == "추가하기" {
            
        }else if gameContent.allCategory?.contains(title) == true{
            contents = gameContent.InitContents(title: title)
        }else if  category.contains(title){
            contents = customContent.InitContents(title: title)
        }else{
            contents = ["해당 컨텐츠가 없습니다."]
        }
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
        UserDefaults.standard.set(favoritDictionary, forKey: "favoritDictionary")
    }
    
    func ReloadCustomCollectionView(Title: String){
        if let userCustom = customContent.customCategory{
            category = ["추가하기"] + userCustom
        }
        collectionView.reloadData()
    }
    
    func delete(title : String){
        customContent.DeleteCustomCategory(title: title)
        category = ["추가하기"] + customContent.customCategory!
        collectionView.reloadData()
    }
    
    func DeleteCustomCatagory(title : String){
        let alert = UIAlertController(title: NSLocalizedString("Delete", comment: ""), message: NSLocalizedString("Do you want to delete?", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("NO", comment: ""), style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Delete", comment: ""), style: .default, handler: {(alert) -> Void in self.delete(title:title) }))
        self.present(alert, animated: true, completion: nil)
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
