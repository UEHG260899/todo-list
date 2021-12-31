//
//  Task.swift
//  TodoApp
//
//  Created by Uriel Hernandez Gonzalez on 30/12/21.
//

import Foundation
import RealmSwift

class Task: Object{
    @Persisted(primaryKey: true) var id = 0
    @Persisted var title: String! = ""
    @Persisted var subTitle: String! = ""
    @Persisted var descript: String! = ""
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(Task.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}
