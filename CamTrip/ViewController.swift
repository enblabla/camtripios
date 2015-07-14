//
//  ViewController.swift
//  CamTrip
//
//  Created by Enrique Blasco Blanquer on 6/7/15.
//  Copyright (c) 2015 Enrique Blasco Blanquer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtpass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGestureRecognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyBoard")
        
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func dismissKeyBoard() {
        self.txtemail.resignFirstResponder()
        self.txtpass.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(sender: AnyObject) {
        
    }

    
    @IBAction func registrar(sender: AnyObject) {
        
    }
    
}

