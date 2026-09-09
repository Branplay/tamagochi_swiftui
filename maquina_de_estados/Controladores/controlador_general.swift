//
//  controlador_general.swift
//  maquina_de_estados
//
//  Created by alumno on 9/7/26.
//
import Foundation

@Observable ///
class ControladorGeneral{
    var tamagochi: Tamagochi
    
    init(tamagochi_a_cargar: Tamagochi? = nil) {
        if let tamagochi_a_cargar = tamagochi_a_cargar {
            self.tamagochi = tamagochi_a_cargar
        }
        
        else {
            self.tamagochi = Tamagochi(
                nombre: "Inicial", esta_vivo: false,
                edad: 0, hambre: 100, cansancio: 100,
                limpio: 0, aburrido: 0
            )
        }
    }
    
    func cambiar_nombre(_ nombre_nuevo: String) -> Bool{
        if tamagochi.esta_vivo {
            tamagochi.nombre = nombre_nuevo
        }
        
        return tamagochi.esta_vivo
        
    }
    
    func matar () -> Bool {
        if tamagochi.esta_vivo {
            tamagochi.esta_vivo = false
            return true
        }
        return true
    }
    
    func revivir () -> Bool {
        if !tamagochi.esta_vivo {
            tamagochi.esta_vivo = true
            return true
        }
        return true
    }
}
