//
//  ViewController.swift
//  TodoApp
//
//  Created by Uriel Hernandez Gonzalez on 28/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        title = "To Do"
        let font = UIFont.systemFont(ofSize: 30.0)
        let rightItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(newTask))
        rightItem.setTitleTextAttributes([.font : font], for: .normal)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = rightItem
    }
    
    
    @objc
    func newTask(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CreateTaskViewController") as! CreateTaskViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

