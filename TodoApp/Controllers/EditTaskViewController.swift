//
//  EditTaskViewController.swift
//  TodoApp
//
//  Created by Uriel Hernandez Gonzalez on 31/12/21.
//

import UIKit
import RealmSwift
import MaterialComponents

class EditTaskViewController: UIViewController {

    
    @IBOutlet weak var titleTF: MDCOutlinedTextField!
    @IBOutlet weak var subtitleTF: MDCOutlinedTextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var cornerView: UIView!
    
    public var task: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        UIUtils.setupTextFields(for: [ titleTF : "Title", subtitleTF : "Subtitle" ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    func setupUI() {
        title = "Edit Task"
        cornerView.layer.cornerRadius = 50
        cornerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textView.layer.borderWidth = 2
        textView.layer.cornerRadius = 6.0
        textView.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1).cgColor
        editBtn.layer.cornerRadius = 6.0
        editBtn.layer.borderWidth = 2
        editBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    func setup() {
        titleTF.text = task.title
        subtitleTF.text = task.subTitle
        textView.text = task.descript
    }
    
    
    func validate() -> Bool {
        var valid = true
        valid = !titleTF.text!.isEmpty && valid
        valid = !subtitleTF.text!.isEmpty && valid
        valid = !textView.text.isEmpty && valid
        return valid
    }
    
    func saveData() {
        let realm = try! Realm()
        let realmTask = realm.objects(Task.self).where {
            $0.id == self.task.id
        }.first!
        try! realm.write({
            realmTask.title = titleTF.text!
            realmTask.subTitle = subtitleTF.text!
            realmTask.descript = textView.text
        })
    }
    
    
    @IBAction func onClickedEdit(_ sender: Any) {
        if validate() {
            saveData()
            let alert = UIUtils.showAlert(tile: "Success", message: "The task has been updated", type: .success, controller: self)
            present(alert, animated: true)
        }else {
            let alert = UIUtils.showAlert(tile: "Warning", message: "All fields are required", type: .error, controller: self)
            present(alert, animated: true)
        }
    }
}
