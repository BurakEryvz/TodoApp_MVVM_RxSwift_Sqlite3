//
//  Task.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 24.02.2024.
//

import Foundation

class Task {
    var task_id: Int?
    var task_title: String?
    var task_icon: String?
    var task_hexColor: String?
    var task_isCompleted: Bool?
    
    init(task_id: Int, task_title: String, task_icon: String, task_hexColor: String, task_isCompleted: Bool) {
        self.task_id = task_id
        self.task_title = task_title
        self.task_icon = task_icon
        self.task_hexColor = task_hexColor
        self.task_isCompleted = task_isCompleted
    }
}
