//
//  ViewController.swift
//  TodoApp
//
//  Created by Uriel Hernandez Gonzalez on 28/12/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var tasks: Results<Task>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    func fetchData() {
        let realm = try! Realm()
        tasks = realm.objects(Task.self)
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "taskCell")
    }
    
    func setupUI(){
        title = "To Do"
        let font = UIFont.systemFont(ofSize: 30.0)
        let rightItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(newTask))
        rightItem.setTitleTextAttributes([.font : font], for: .normal)
        navigationItem.rightBarButtonItem = rightItem
    }
    
    
    @objc
    func newTask(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CreateTaskViewController") as! CreateTaskViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

//MARK: - Delegates

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Mark as Done"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(tasks[indexPath.row])
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        cell.task = tasks[indexPath.row]
        cell.setup()
        cell.onClicked = {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController
            vc.task = self.tasks[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    
}

