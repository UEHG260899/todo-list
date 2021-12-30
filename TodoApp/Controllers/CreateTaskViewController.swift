//
//  CreateTaskViewController.swift
//  TodoApp
//
//  Created by Uriel Hernandez Gonzalez on 29/12/21.
//

import UIKit

class CreateTaskViewController: UIViewController {

    
    @IBOutlet weak var titleLbl: UITextField!
    @IBOutlet weak var subtitleLbl: UITextField!
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
    


}
