//
//  Add_CustomTheme_ViewController.swift
//  Structure
//
//  Created by Carson's Macbook Pro on 02/02/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class Add_CustomTheme_ViewController: UIViewController {

    let db = Firestore.firestore()
    
    var customThemeList : [CustomData]?
    var custom1 = CustomData(customName: "", customWord: [""])
    
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
        custom1.customName = (customTitle?.text)!
        custom1.customWord = [word1?.text, word2?.text, word3?.text, word4?.text, word5?.text, word6?.text, word7?.text, word8?.text, word9?.text, word10?.text] as! Array<String>

        var ref: DocumentReference? = nil
        ref = db.collection("CustomDB").addDocument(data: [
            "customName" : custom1.customName,
            "customWord": custom1.customWord
            ]){ err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
        navigationController?.popViewController(animated: false)
        
    }
    
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


