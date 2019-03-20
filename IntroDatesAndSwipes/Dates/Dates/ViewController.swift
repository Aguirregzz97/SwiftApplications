//
//  ViewController.swift
//  Dates
//
//  Created by Alumno on 2/14/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yearOutlet: UILabel!
    @IBOutlet weak var monthOutlet: UILabel!
    @IBOutlet weak var dayWeekOutlet: UILabel!
    @IBOutlet weak var dayOutlet: UILabel!
    
    var fecha = Date()
    var formateador = DateFormatter()
    
    func actualizaLabels() {
        
        formateador.dateFormat = "yyyy"
        yearOutlet.text = formateador.string(from: fecha)
        
        formateador.dateFormat = "MMMM"
        monthOutlet.text = formateador.string(from: fecha)
        
        formateador.dateFormat = "dd"
        dayOutlet.text = formateador.string(from: fecha)
        
        formateador.dateFormat = "EEEE"
        dayWeekOutlet.text = formateador.string(from: fecha)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actualizaLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func atenderSwipe(_ sender: UISwipeGestureRecognizer) {
        
        if (sender.direction == .left) {
            fecha = fecha.addingTimeInterval(86400)
        }
        else {
            fecha = fecha.addingTimeInterval(-86400)
        }
        actualizaLabels()
    }
    
}

