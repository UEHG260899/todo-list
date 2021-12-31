//
//  EditTaskViewController.swift
//  TodoApp
//
//  Created by Uriel Hernandez Gonzalez on 31/12/21.
//

import UIKit

class EditTaskViewController: UIViewController {

    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var subtitleTF: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var editBtn: UIButton!
    
    public var task: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    func setupUI() {
        title = "Edit Task"
        textView.layer.borderWidth = 2
        textView.layer.cornerRadius = 6.0
        textView.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1).cgColor
        editBtn.layer.borderWidth = 2
        editBtn.layer.borderColor = UIColor(red: 19/255, green: 132/255, blue: 1, alpha: 1).cgColor
    }
    
    func setup() {
        titleTF.text = task.title
        subtitleTF.text = task.subTitle
        textView.text = task.descript
    }
}
