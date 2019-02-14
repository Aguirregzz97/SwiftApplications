//
//  TableViewController.swift
//  TableViewAct
//
//  Created by Alumno on 2/11/19.
//  Copyright © 2019 ITESM. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listaJugadores = [Jugador]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let jug1 = Jugador(nombre: "Silvia", puntos: 2345, email: "silvia@tec.mx")
        let jug2 = Jugador(nombre: "Andres", puntos: 3000, email: "aguirregzz97@gmail.com")
        let jug3 = Jugador(nombre: "Reynaldo", puntos: 2000, email: "rey@tec.mx")
        listaJugadores += [jug1, jug2, jug3]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        cell.textLabel?.text = listaJugadores[indexPath.row].nombre
        cell.imageView?.image = UIImage(named: "img" + String(indexPath.row))
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vistaDet = segue.destination as! ViewController
        let indice = tableView.indexPathForSelectedRow!
        vistaDet.jugadorObj = listaJugadores[indice.row]
        vistaDet.imgVar = UIImage(named: "img" + String(indice.row))
    }

}
