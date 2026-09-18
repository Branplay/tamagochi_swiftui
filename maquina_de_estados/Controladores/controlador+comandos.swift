//
//  controlador+comandos.swift
//  maquina_de_estados
//
//  Created by alumno on 9/18/26.
//
import ARKit



enum ComandoTamagochi: Comando{
    case darle_un_dulce
    case darle_un_sape
    case darle_brocoli
}

extension ControladorGeneral: ProcesarComandos{
    func procesar_comando(_ comando: Comando) -> Bool {
        if (!(comando is ComandoTamagochi)){
            return false
        }
        
        switch(comando as! ComandoTamagochi){
        case .darle_un_dulce:
            entretener()
            alimentar()
            
        case .darle_un_sape:
            adormilar()
            enojar()
            
        case .darle_brocoli:
            alimentar()
            enojar()
        }
        
        return true
    }
}



