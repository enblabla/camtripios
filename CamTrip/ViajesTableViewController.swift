//
//  ViajesTableViewController.swift
//  CamTrip
//
//  Created by Enrique Blasco Blanquer on 6/7/15.
//  Copyright (c) 2015 Enrique Blasco Blanquer. All rights reserved.
//

import UIKit

class ViajesTableViewController: UITableViewController {

    
    var listaViajes:[Viaje] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationItem.backBarButtonItem?.title = "salir";
        
        createViajes();
    }
    
    override func viewWillDisappear(animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController()){
            
            //eliminamos la variable del localStorage
            let localStorage = NSUserDefaults.standardUserDefaults();
            localStorage.removeObjectForKey("id_usuario");
        }
    }

    func createViajes(){
        
        var viaje1 = Viaje();
        viaje1.titulo="Paris";
        viaje1.fecha = "14/08/2014";
        viaje1.portada="foto.jpg";
        listaViajes.append(viaje1);
        
        var viaje2 = Viaje();
        viaje2.titulo="Roma";
        viaje2.fecha = "14/08/2014";
        viaje2.portada="foto1.jpg";
        listaViajes.append(viaje2);
        
        var viaje3 = Viaje();
        viaje3.titulo="Cuenca";
        viaje3.fecha = "14/08/2014";
        viaje3.portada="foto2.jpg";
        listaViajes.append(viaje3);
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return listaViajes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellViaje", forIndexPath: indexPath) as! ViajeTableViewCell

        var viaje:Viaje = listaViajes[indexPath.row];
        
        cell.txtTitulo.text = viaje.titulo;
        cell.txtFecha.text = viaje.fecha;
        var image = UIImage(named: viaje.portada!);
        cell.portada.image = image;
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
