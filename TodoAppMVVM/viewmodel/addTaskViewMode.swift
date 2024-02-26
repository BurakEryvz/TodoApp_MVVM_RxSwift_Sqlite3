//
//  addTaskViewMode.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 25.02.2024.
//

import Foundation

class AddTaskViewModel {
    
    var taskDaoRepository = TasksDaoRepository()
    
    
    
    func saveTask(task_title: String, task_icon: String, task_color: String, isCompleted: Bool) {
        taskDaoRepository.saveTask(task_title: task_title, task_icon: task_icon, task_color: task_color, isTaskCompleted: isCompleted)
    }
}
