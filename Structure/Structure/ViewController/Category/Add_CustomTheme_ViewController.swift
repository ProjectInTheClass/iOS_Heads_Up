//
//  Add_CustomTheme_ViewController.swift
//  Structure
//
//  Created by Carson's Macbook Pro on 02/02/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

protocol addDelegateProtocol {
    func ReloadCollectionView(Title: String)
}

class Add_CustomTheme_ViewController: UIViewController {
    
    var customContent = Custom()
    var delegate : addDelegateProtocol?

    @IBOutlet weak var customTitle: UITextField!
    @IBOutlet weak var word1: UITextField!
    @IBOutlet weak var word2: UITextField!
    @IBOutlet weak var word3: UITextField!
    @IBOutlet weak var word4: UITextField!
    @IBOutlet weak var word5: UITextField!
    @IBOutlet weak var word6: UITextField!
    @IBOutlet weak var word7: UITextField!
    @IBOutlet weak var word8: UITextField!
    @IBOutlet weak var word9: UITextField!
    @IBOutlet weak var word10: UITextField!
    
    @IBAction func makeCustomTheme(_ sender: Any) {
        var title : String?
        var words : [String] = ["해덩컨텐츠가 없습니다"]
        if let _ = customTitle.text{
            title = customTitle.text
        }else{
            title = "제목없음"
        }
        words = [word1.text,word2.text,word3.text,word4.text,word5.text,word6.text,word7.text,word8.text,word9.text,word10.text] as! [String]
        customContent.MakeCustomData(Title: title!, Words: words)
        delegate?.ReloadCollectionView(Title: title!)
        navigationController?.popViewController(animated: true)
    }
    
   // navigationController?.popViewController(animated: false)
    
    
    
    @IBAction func TouchCancle(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
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


