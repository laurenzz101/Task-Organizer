//
//  TaskViewController.swift
//  Task Organizer
//
//  Created by Lauren Miller on 8/27/22.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var task: String?
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()


        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
       guard let count = UserDefaults().value(forKey: "count") as? Int else {
           return
        }
        if count >= 1 {
        let newCount = count - 1
        UserDefaults().setValue(newCount, forKey: "count")
        UserDefaults().setValue(nil, forKey: "task_\(count)")
        
            update?()
            navigationController?.popViewController(animated: true)
        }
    }
    



}
