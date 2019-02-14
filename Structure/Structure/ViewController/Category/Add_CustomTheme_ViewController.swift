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

class Add_CustomTheme_ViewController: UIViewController, UITextFieldDelegate {
    
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

        makeAngleRound.layer.cornerRadius = 8.0
        customTitle.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        for textFieldObject in wordsCollection
        {
            textFieldObject.delegate = self
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBOutlet var scrollView: UIScrollView!
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    @available(iOS 2.0, *)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == customTitle {
            wordsCollection[0].becomeFirstResponder()
        }else {
            for wordTextfile in 0...wordsCollection.count - 2{
                if textField == wordsCollection[wordTextfile]{
                    wordsCollection[wordTextfile + 1].becomeFirstResponder()
                }
            }
            if textField == wordsCollection[wordsCollection.count - 1]{
                view.endEditing(true)
                return false
            }
        }
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


