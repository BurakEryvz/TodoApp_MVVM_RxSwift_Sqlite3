//
//  HomepageVC.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 24.02.2024.
//

import UIKit

class HomepageVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tasks = [Task]()
    var colors = [UIColor]()
    var viewModel = HomepageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var _ = viewModel.taskList.subscribe { tasks in
            self.tasks = tasks
            self.collectionView.reloadData()
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "TaskCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TaskCell")
        
        let customNavigationController = CustomNavigation()
        customNavigationController.setNavigation(navigationController: self.navigationController!, navigationItem: self.navigationItem, title: "TaskTrack")
        
        let customTabBar = CustomTabBar()
        customTabBar.setTabBar(tabBarController: self.tabBarController!)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        
        let itemWidth = (UIScreen.main.bounds.width - 30) / 2
        
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        collectionView.collectionViewLayout = flowLayout
        
       
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewModel.loadTasks()
    }
    
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        let cells = collectionView.visibleCells as! [TaskCell]
        for cell in cells {
            if cell.deleteButton.isHidden == false {
                cell.deleteButton.isHidden = true
            } else {
                cell.deleteButton.isHidden = false
            }
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }

}

extension HomepageVC: UISearchBarDelegate {
    
}

extension HomepageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let task = self.tasks[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        cell.delegate = self
        cell.indexPath = indexPath
        
        cell.containerView.backgroundColor = UIColor.systemMint
        cell.titleLabel.text = task.task_title
        cell.iconLabel.text = task.task_icon
        cell.containerView.backgroundColor = UIColor(named: task.task_hexColor!)
        
        if var checkmarkColor = cell.checkmarkButton.tintColor, let isCompleted = task.task_isCompleted {
            if isCompleted == true {
                checkmarkColor = .systemGreen
            } else {
                checkmarkColor = .darkGray
            }
        }
        
        
        return cell
    }
    
    
    
}

extension UIView {
    func circleView() {
        self.layer.cornerRadius = (self.frame.size.width) / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 0.0
        self.layer.borderColor = UIColor.white.cgColor
    }
}

extension HomepageVC: TaskCellDelegate {
    func deletePressed(indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        viewModel.deleteTask(task_id: task.task_id!)
    }
    
    
    
    func checkmarkPressed(indexPath: IndexPath) {
        let cell = self.collectionView.cellForItem(at: indexPath) as! TaskCell
        let task = tasks[indexPath.row]
        var newStatus = false
        
        print("Pressed task is      : \(task.task_title!) and value is   : \(task.task_isCompleted!)")
        
        if task.task_isCompleted == true {
            newStatus = false
            cell.checkmarkButton.tintColor = UIColor.darkGray
            viewModel.updateCompleteStatus(indexPath: indexPath, newStatus: newStatus, task_id: task.task_id!)
        } else {
            newStatus = true
            cell.checkmarkButton.tintColor = UIColor.systemGreen
            viewModel.updateCompleteStatus(indexPath: indexPath, newStatus: newStatus, task_id: task.task_id!)
        }
        
    }
    
    
    
    
}
