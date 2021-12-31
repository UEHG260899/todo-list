//
//  TaskTableViewCell.swift
//  TodoApp
//
//  Created by Uriel Hernandez Gonzalez on 31/12/21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var chevronButton: UIButton!
    
    public var onClicked: (() -> Void)!
    public var task: Task!
    

    func setup() {
        chevronButton.setTitle("", for: .normal)
        titleLbl.text = task.title
        subtitleLbl.text = task.subTitle
    }
    

    @IBAction func onClickedEdit(_ sender: Any) {
        onClicked()
    }
    
}
