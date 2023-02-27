//
//  ColorDetailsVC.swift
//  RandomColorApp
//
//  Created by Danny Espinoza Sanchez on 2/25/23.
//

import UIKit

class ColorDetailsVC: UIViewController {
    
    @IBOutlet weak var colorContainer: UIView!
     var colorSelected:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorContainer.backgroundColor = colorSelected
    }
}
