//
//  CreateTaskViewController.swift
//  TodoApp
//
//  Created by Uriel Hernandez Gonzalez on 29/12/21.
//

import UIKit
import RealmSwift

class CreateTaskViewController: UIViewController {

    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var subtitleTF: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var createBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI(){
        title = "New Task"
        textView.layer.cornerRadius = 6.0
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1).cgColor
        createBtn.layer.cornerRadius = 6.0
        createBtn.layer.borderWidth = 2
        createBtn.layer.borderColor = UIColor(red: 19/255, green: 132/255, blue: 1, alpha: 1).cgColor
    }
    
    func validate() -> Bool {
        //TODO : Validations
        return true
    }
    
    func saveTask() {
        let realm = try! Realm()
        
        try! realm.write {
            let task = Task()
            task.id = task.incrementID()
            task.title = titleTF.text!
            task.subTitle = subtitleTF.text!
            task.descript = textView.text!
            realm.add(task)
        }

    }
    

    @IBAction func onClickedAdd(_ sender: Any) {
        if validate(){
            saveTask()
            let alert = UIUtils.showAlert(tile: "Success", message: "Task Added!", type: .success, controller: self)
            self.present(alert, animated: true)
        }
    }
}
