//
//  HomepageViewModel.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 25.02.2024.
//

import Foundation
import RxSwift

class HomepageViewModel {
    var tasksDaoRepository = TasksDaoRepository()
    var taskList = BehaviorSubject<[Task]>(value: [Task]())
    
    init() {
        copyDatabase()
        loadTasks()
        self.taskList = tasksDaoRepository.taskList
    }
    
    func loadTasks() {
        tasksDaoRepository.loadTask()
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "Task", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("Tasks.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: copyPath.path) {
            print("Database already exist.")
        } else {
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
            }catch{}
        }
    }
    
    func updateCompleteStatus(indexPath: IndexPath, newStatus: Bool, task_id: Int) {
        tasksDaoRepository.updateCompleteStatus(indexPath: indexPath, newStatus: newStatus, task_id: task_id)
    }
    
    func deleteTask(task_id: Int) {
        tasksDaoRepository.deleteTask(task_id: task_id)
    }
}
