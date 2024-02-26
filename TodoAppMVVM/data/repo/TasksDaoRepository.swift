//
//  TasksDaoRepository.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 25.02.2024.
//

import Foundation
import MCEmojiPicker
import UIKit
import RxSwift


class TasksDaoRepository {
    
    let db: FMDatabase?
    var taskList = BehaviorSubject<[Task]>(value: [Task]())
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("Tasks.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    
    func saveTask(task_title: String, task_icon: String, task_color: String, isTaskCompleted: Bool) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO Tasks (task_title, task_icon, isTaskCompleted, task_color) VALUES (?, ?, ?, ?)", values: [task_title, task_icon, isTaskCompleted, task_color])
            print("Data was saved.")
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
    
    func loadTask() {
        var tasks = [Task]()

        db?.open()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM Tasks", values: nil)
            while result.next() {
                let task = Task(task_id: Int(result.string(forColumn: "task_id"))!, task_title: result.string(forColumn: "task_title"), task_icon: result.string(forColumn: "task_icon"), task_hexColor: result.string(forColumn: "task_color"), task_isCompleted: Bool(result.bool(forColumn: "isTaskCompleted")))
                
                tasks.append(task)
            }
            
            taskList.onNext(tasks)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func updateCompleteStatus(indexPath: IndexPath, newStatus :Bool, task_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE Tasks SET isTaskCompleted = ? WHERE task_id = ?", values: [newStatus, task_id])
            print("Data was updated")
            loadTask()
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func deleteTask(task_id: Int) {
        db?.open()
        
        do {
            try db?.executeUpdate("DELETE FROM Tasks WHERE task_id = ?", values: [task_id])
            print("Data was deleted.")
            loadTask()
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
    
}
