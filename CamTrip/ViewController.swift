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
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var respuestaPHP:NSString?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //COMPROBAR QUE SI TENEMOS LA ID ALMACENADA, DIRECTAMENTE MOSTRAMOS LA VENTANA PRINCIPAL
        let localStorage = NSUserDefaults.standardUserDefaults();
        
        
        
        if let id_usuario = localStorage.stringForKey("id_usuario"){
            //Existe la variable id_usuario en el localStorage
            //redireccionamos a la ventana principal, el listado
            let viewLista = self.storyboard?.instantiateViewControllerWithIdentifier("listaViajes") as! ViajesTableViewController;
            self.navigationItem.title = "salir";
            self.navigationController?.pushViewController(viewLista, animated: false);
            
        }
        
        
        
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
        //funcion para hacer login
        let txtCorreo:String = txtemail.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
        let txtPassword:String = txtpass.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
        
        if count(txtCorreo) == 0 {
            let alert:UIAlertView = UIAlertView(title: "Error", message: "Todos los campos son obligatorios", delegate: nil, cancelButtonTitle: "Vale");
            alert.show();
        } else if count(txtPassword) == 0{
            let alert:UIAlertView = UIAlertView(title: "Error", message: "Todos los campos son obligatorios", delegate: nil, cancelButtonTitle: "Vale");
            alert.show();
        } else {
            //hacemos login
            //1º Mostramos el loading
            loading.hidden = false;
            
            //2º Url del webservice
            let urlPHP = "http://webdisseny.es/camtrip/Camtrip.php?p=login";
            
            //3º Preparamos el paquete para el webservice
            var datosEnvio:NSMutableString = "correo=";
            datosEnvio.appendString(txtCorreo);
            datosEnvio.appendString("&password=");
            datosEnvio.appendString(txtPassword);
            
            //4º Preparamos al carter
            var request = NSMutableURLRequest(URL: NSURL(string: urlPHP)!);
            request.HTTPMethod = "POST";
            
            //5º Ponemos mochila al carterlo
            request.HTTPBody = (datosEnvio as String).dataUsingEncoding(NSUTF8StringEncoding)
            
            //6º Creamos un proceso nuevo, donde a request con el paquete datosEnvio envie los datos al webservice
            let proceso: Void = NSURLSession.sharedSession().dataTaskWithRequest(request,
                completionHandler:{(data:NSData!,response:NSURLResponse!,error:NSError!) in
                    
                    
                    if error != nil {
                        var alert:UIAlertView = UIAlertView(title: "Error", message: "Error al conectar", delegate: nil, cancelButtonTitle: "Ok");
                        alert.show();
                        
                    }else{
                        //TODO EL CODIGO CUANDO TENGAMOS LA RESPUESTA DEL WEBSERVICE
                        self.respuestaPHP = NSString(data: data, encoding: NSUTF8StringEncoding);
                        
                        //MATAR AL PROCESO ACTUAL, Y VOLVER AL PROCESO MAIN
                        dispatch_async(dispatch_get_main_queue(), {
                            
                            //AQUI DENTRO ESTOY DE NUEVO EN EL PROCESO MAIN
                            self.loading.hidden = true;
                            self.comprobarRespuesta();
                            
                        });
                    }
                    
                    
                }
                ).resume();
  
            
        }
        
        
    }

    
    @IBAction func registrar(sender: AnyObject) {
        
        //funcion para hacer login
        let txtCorreo:String = txtemail.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
        let txtPassword:String = txtpass.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
        
        if count(txtCorreo) == 0 {
            let alert:UIAlertView = UIAlertView(title: "Error", message: "Todos los campos son obligatorios", delegate: nil, cancelButtonTitle: "Vale");
            alert.show();
        } else if count(txtPassword) == 0{
            let alert:UIAlertView = UIAlertView(title: "Error", message: "Todos los campos son obligatorios", delegate: nil, cancelButtonTitle: "Vale");
            alert.show();
        } else {
            //hacemos login
            //1º Mostramos el loading
            loading.hidden = false;
            
            //2º Url del webservice
            let urlPHP = "http://webdisseny.es/camtrip/Camtrip.php?p=registro";
            
            //3º Preparamos el paquete para el webservice
            var datosEnvio:NSMutableString = "correo=";
            datosEnvio.appendString(txtCorreo);
            datosEnvio.appendString("&password=");
            datosEnvio.appendString(txtPassword);
            
            //4º Preparamos al carter
            var request = NSMutableURLRequest(URL: NSURL(string: urlPHP)!);
            request.HTTPMethod = "POST";
            
            //5º Ponemos mochila al carterlo
            request.HTTPBody = (datosEnvio as String).dataUsingEncoding(NSUTF8StringEncoding)
            
            //6º Creamos un proceso nuevo, donde a request con el paquete datosEnvio envie los datos al webservice
            let proceso: Void = NSURLSession.sharedSession().dataTaskWithRequest(request,
                completionHandler:{(data:NSData!,response:NSURLResponse!,error:NSError!) in
                    
                    
                    if error != nil {
                        var alert:UIAlertView = UIAlertView(title: "Error", message: "Error al conectar", delegate: nil, cancelButtonTitle: "Ok");
                        alert.show();
                        
                    }else{
                        //TODO EL CODIGO CUANDO TENGAMOS LA RESPUESTA DEL WEBSERVICE
                        self.respuestaPHP = NSString(data: data, encoding: NSUTF8StringEncoding);
                        
                        //MATAR AL PROCESO ACTUAL, Y VOLVER AL PROCESO MAIN
                        dispatch_async(dispatch_get_main_queue(), {
                            
                            //AQUI DENTRO ESTOY DE NUEVO EN EL PROCESO MAIN
                            self.loading.hidden = true;
                            self.comprobarRegistro();
                            
                        });
                    }
                    
                    
                }
                ).resume();
        
        }
        
        
        
        
        
        
        
    }
    
    
    func comprobarRespuesta(){
        if(respuestaPHP == "-1"){
            var alert:UIAlertView = UIAlertView(title: "Error", message: "Usuario o contraseña incorrectas, prueba con otras o registra un nuevo usuario", delegate: nil, cancelButtonTitle: "ok");
            alert.show();
        }else{
            //almacenamos la id en el local storage
            let localStorage = NSUserDefaults.standardUserDefaults();
            localStorage.setObject(respuestaPHP, forKey: "id_usuario");
            
            //redireccionamos a la ventana principal, el listado
            let viewLista = self.storyboard?.instantiateViewControllerWithIdentifier("listaViajes") as! ViajesTableViewController;
            self.navigationItem.title = "salir";
            self.navigationController?.pushViewController(viewLista, animated: true);
            
        }
    }
    func comprobarRegistro(){
        if(respuestaPHP == "-1"){
            var alert:UIAlertView = UIAlertView(title: "Error", message: "Usuario registrado.", delegate: nil, cancelButtonTitle: "ok");
            alert.show();
        }else{
            //almacenamos la id en el local storage
            let localStorage = NSUserDefaults.standardUserDefaults();
            localStorage.setObject(respuestaPHP, forKey: "id_usuario");
            
            //redireccionamos a la ventana principal, el listado
            let viewLista = self.storyboard?.instantiateViewControllerWithIdentifier("listaViajes") as! ViajesTableViewController;
            
            self.navigationItem.title = "salir";
            self.navigationController?.pushViewController(viewLista, animated: true);
            
        }
    }
    
}

