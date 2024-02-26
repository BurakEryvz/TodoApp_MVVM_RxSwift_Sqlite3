//
//  TaskCell.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 24.02.2024.
//

import UIKit

protocol TaskCellDelegate {
    func checkmarkPressed(indexPath: IndexPath)
    func deletePressed(indexPath: IndexPath)
}

class TaskCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkmarkButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var delegate: TaskCellDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        
        deleteButton.isHidden = true
        
                
    }
    
    @IBAction func checkmarkButtonPressed(_ sender: UIButton) {
        print("Checkmark button is working.")
        if let index = indexPath {
            self.delegate?.checkmarkPressed(indexPath: index)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        print("Delete button is working.")
        if let index = indexPath {
            self.delegate?.deletePressed(indexPath: index)
        }
    }
    
}
