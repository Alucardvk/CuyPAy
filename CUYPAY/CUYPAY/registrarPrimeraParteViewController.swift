//
//  registrarPrimeraParteViewController.swift
//  CUYPAY
//
//  Created by KAWORU on 29/04/25.
//

import UIKit

class registrarPrimeraParteViewController: UIViewController {
    
    var usuario = Usuario(
        nombre: "",
        apellidos: "",
        usuario: "",
        email: "",
        clave1: "",
        clave2: ""
    )

    @IBOutlet weak var nombreText: UITextField!
    
    @IBOutlet weak var apellidoText: UITextField!
    
    @IBOutlet weak var correoText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func volverLogin(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func siguiente(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "segundoRegistro" {
            guard
                let nombre = nombreText.text, !nombre.isEmpty,
                let apellidos = apellidoText.text, !apellidos.isEmpty,
                let email = correoText.text, !email.isEmpty
            else {
                mostrarAlerta(titulo: "Error", mensaje: "Por favor, completa todos los campos")
                return false
            }
            
            // Setea el usuario aquí, así estará listo para el prepare()
            usuario.nombre = nombre
            usuario.apellidos = apellidos
            usuario.email = email
            
            return true
        }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segundoRegistro" {
            if let destino = segue.destination as? registrarSegundaParteViewController{
                destino.usuario = usuario
                print("✅ Se está ejecutando prepare: \(usuario)")
            }
        }
    }
    
    func mostrarAlerta(titulo: String, mensaje: String) {
        guard presentedViewController == nil else {
                // Si ya hay un ViewController presentado, no mostrar otra alerta
        return
        }
        
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alerta, animated: true)
    }

}

