//
//  ViewController.swift
//  JebM3ak
//
//  Created by Qahtan on 11/30/17.
//  Copyright © 2017 Codesign4. All rights reserved.
//

import UIKit
import Firebase
class TheRoot: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    var listTable : ListTable!
    var arrayOfItems = [String]()
    var ref : FIRDatabase!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure FireDataBase
        ref = FIRDatabase.database().reference()
        itemTextField.delegate = self
        itemTextField.returnKeyType = .send
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pushItemToList(_ sender: Any) {
        print("itemTextField.text",itemTextField.text)
    }
}
extension TheRoot: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let item = textField.text {
            if item != "" {
                ///***** here we add the items to data base ******///
                arrayOfItems.append(item)
                print("arrayOfItems",arrayOfItems)
                textField.resignFirstResponder()
                textField.text = ""
                hendleNavigationToListVC()
            }
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    func hendleNavigationToListVC(){
        listTable = ListTable()
    self.navigationController?.pushViewController(listTable, animated: true)
        listTable.theRoot = self
    }
}
