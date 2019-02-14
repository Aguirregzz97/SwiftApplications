//
//  Jugador.swift
//  TableViewAct
//
//  Created by Alumno on 2/11/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class Jugador: NSObject {
    
    var nombre: String = ""
    var puntos: Int = 0
    var email: String = ""
    
    
    init(nombre: String, puntos: Int, email: String) {
        self.nombre = nombre
        self.puntos = puntos
        self.email = email
    }
}
