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
    
    var estado: EstadosTamagochi = .Neutro
        
    
    
    init(tamagochi_a_cargar: Tamagochi? = nil) {
        if let tamagochi_a_cargar = tamagochi_a_cargar {
            self.tamagochi = tamagochi_a_cargar
        }
        
        else {
            self.tamagochi = Tamagochi(
                nombre: "Ramiro", esta_vivo: true,
                edad: 0, hambre: 150, cansancio: 160,
                limpio: 50, aburrido: 50
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
    
    func actualizar_medidores() -> Bool{
        tamagochi.hambre += 1
        tamagochi.aburrido += 1
        tamagochi.cansancio += 1
        
        tamagochi.limpio -= 1
        
        actualizar_estado()
        return true
    }
    
    func actualizar_estado(){
        switch(estado){
            case .Neutro:
            if tamagochi.hambre > 60{
                estado = .Hambriento
            }
            else if tamagochi.cansancio > 80{
                estado = .Adormilado
            }
            case .Hambriento:
            if tamagochi.hambre > 80{
                estado = .Inanicion
            }
            
            else if tamagochi.hambre < 40{
                estado = .Neutro
            }
        case .Inanicion:
            if tamagochi.hambre > 100{
                estado = .Muerto
            }
            default :
                return
        }
    }
    
    func alimentar() -> Bool{
        if tamagochi.esta_vivo{
            tamagochi.hambre -= 20
            return true
        }
        return false
    }
}
