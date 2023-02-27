//
//  ViewController.swift
//  RandomColorApp
//
//  Created by Danny Espinoza Sanchez on 2/25/23.
//

import UIKit

class ColorSelectorVC: UIViewController {
    
    lazy var colors:[UIColor] = []
    
    @IBOutlet weak var colorsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        generateArrayWithRandomColors()
    }
    
    func generateArrayWithRandomColors(){
        for _ in 0..<20 {
            colors.append(.random)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorDetails = (segue.destination as! ColorDetailsVC)
        colorDetails.colorSelected = sender as? UIColor
    }
}

extension ColorSelectorVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToColorDetails", sender: colors[indexPath.row])
    }
}


