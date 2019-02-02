//
//  Add_CustomTheme_ViewController.swift
//  Structure
//
//  Created by Carson's Macbook Pro on 02/02/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

import UIKit
import Firebase

class Add_CustomTheme_ViewController: UIViewController {


    //var ref : DatabaseReference!
    var customThemeList : [CustomData]?
    var custom1 = CustomData(customName: "", favorite : true, customWord: ["","","","",""])
    
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
        /*이부분이 커스텀 구조체를 DB에 올리는 부분인데 아직 잘 모르겟어... 직접 빌드하면서 해봐야될거같아
        self.ref = Database.database().reference()
        let itemRef = self.ref.child("list")
        itemRef.setValue(self.custom1)
        */
        self.dismiss(animated: false, completion: nil)
        
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
