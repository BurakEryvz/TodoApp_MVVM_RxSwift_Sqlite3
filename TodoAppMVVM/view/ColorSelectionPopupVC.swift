//
//  ColorSelectionPopupVC.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 25.02.2024.
//

import UIKit



class ColorSelectionPopupVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet var colorButtons: [UIButton]!
    
    var delegate: ColorSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        containerView.layer.backgroundColor = UIColor.tertiarySystemBackground.cgColor
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        
        for button in colorButtons {
            button.circleView()
        }
    }
    

    @IBAction func colorButtonPressed(_ sender: UIButton) {
        
        delegate?.getColor(colorString: (sender.titleLabel?.text)!)
        dismiss(animated: true)
        
    }
    
    
    

}
