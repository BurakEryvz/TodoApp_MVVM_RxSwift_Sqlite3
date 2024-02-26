//
//  AddTaskVC.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 25.02.2024.
//

import UIKit
import MCEmojiPicker

protocol ColorSelectionDelegate {
    func getColor(colorString: String)
}

class AddTaskVC: UIViewController, ColorSelectionDelegate {
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextView: UITextView!
    @IBOutlet weak var taskIconContainerView: UIView!
    @IBOutlet weak var taskIconLabel: UILabel!
    @IBOutlet weak var taskColorView: UIView!
    
    var colorSelectionDelegate: ColorSelectionDelegate?
    var currentColor: String?
    
    var viewModel = AddTaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskIconContainerView.circleView()
        taskColorView.circleView()
        taskColorView.backgroundColor = UIColor(named: "ColorButtonBlue")
        
        currentColor = "ColorButtonBlue"
        
    }
    

    @IBAction func selectIconButtonPressed(_ sender: UIButton) {
        selectIcon(sender: sender)
    }
    
    @IBAction func selectColorButtonPressed(_ sender: UIButton) {
        selectColor()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        if let title = taskTitleTextField.text , let icon = taskIconLabel.text, let color = currentColor {
            viewModel.saveTask(task_title: title, task_icon: icon, task_color: color, isCompleted: false)
            navigationController?.popViewController(animated: true)
        } else {
            print("Please fill all fields")
        }
    }
    
    func selectIcon(sender: UIButton) {
        print("Icon selected.")
        let viewController = MCEmojiPickerViewController()
        viewController.delegate = self
        viewController.sourceView = sender
        present(viewController, animated: true)
    }
    
    func selectColor() {
        print("Color selected.")
    }
    
    
    
    func getColor(colorString: String) {
        currentColor = colorString
        taskColorView.backgroundColor = UIColor(named: colorString)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toColorSelection" {
            let destinationVC = segue.destination as! ColorSelectionPopupVC
            destinationVC.delegate = self
            print("toColorSelection segue is working...")
        }
    }
    
}

extension AddTaskVC: MCEmojiPickerDelegate {
    func didGetEmoji(emoji: String) {
        taskIconLabel.text = emoji
    }
    
    
}
