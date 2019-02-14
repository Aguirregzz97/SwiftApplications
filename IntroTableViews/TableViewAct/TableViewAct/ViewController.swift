//
//  ViewController.swift
//  TableViewAct
//
//  Created by Alumno on 2/11/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var nombreOut: UILabel!
    @IBOutlet weak var puntosOut: UILabel!
    @IBOutlet weak var mailOut: UILabel!
    @IBOutlet weak var imgOutlet: UIImageView!
    
    var jugadorObj: Jugador!
    var imgVar: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nombreOut.text = jugadorObj.nombre
        puntosOut.text = String(jugadorObj.puntos)
        mailOut.text = jugadorObj.email
        imgOutlet.image = imgVar
    }


}

