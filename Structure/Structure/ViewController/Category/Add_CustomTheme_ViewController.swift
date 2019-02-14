//
//  Add_CustomTheme_ViewController.swift
//  Structure
//
//  Created by Carson's Macbook Pro on 02/02/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit

protocol addDelegateProtocol {
    func ReloadCustomCollectionView(Title: String)
}

class Add_CustomTheme_ViewController: UIViewController {
    
    var customContent : Custom?
    var delegate : addDelegateProtocol?
    var words : [String] = ["해당 컨텐츠가 없습니다"]
    
    @IBOutlet weak var customTitle: UITextField!

    
    @IBOutlet var wordsCollection: [UITextField]!
    
    
    @IBAction func makeCustomTheme(_ sender: Any) {
        var title : String?
        
        if let _ = customTitle.text{
            title = customTitle.text
        }else{
            title = "제목없음"
        }
        
        
        for textFieldObject in wordsCollection
        {
            MakeWords(word: textFieldObject.text)
        }
        customContent?.MakeCustomData(Title: title!, Words: words)
        delegate?.ReloadCustomCollectionView(Title: title!)
        navigationController?.popViewController(animated: true)
    }
    
    
    func MakeWords(word : String?){
        if word != ""{
            if words[0] == "해당 컨텐츠가 없습니다"{
                words[0] = word!
            }else{
                words.append(word!)
            }
        }
    }
   // navigationController?.popViewController(animated: false)
    
    
    
    @IBOutlet weak var makeAngleRound: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9436810613, green: 0.9736506343, blue: 0.9642569423, alpha: 0.8319487236)
        makeAngleRound.layer.cornerRadius = 8.0
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBOutlet var scrollView: UIScrollView!
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    @objc func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue

        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
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


