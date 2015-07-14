//
//  CollectionViewController.swift
//  CamTrip
//
//  Created by Enrique Blasco Blanquer on 6/7/15.
//  Copyright (c) 2015 Enrique Blasco Blanquer. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    var listaFotos:[String]=[];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        createFotos();
        // Register cell classes
        //self.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CellFoto")

        
    }
    
    
    func createFotos(){
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
        listaFotos.append("foto.jpg");
        listaFotos.append("foto1.jpg");
        listaFotos.append("foto2.jpg");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return listaFotos.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellFoto", forIndexPath: indexPath) as! CollectionViewCell
    
        var foto = listaFotos[indexPath.row];
        
        let image = UIImage(named: foto);
        
        if var fotoCell = cell.foto{
            fotoCell.image = image
        }
        
      
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
