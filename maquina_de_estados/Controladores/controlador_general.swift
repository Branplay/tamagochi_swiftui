import Foundation

@Observable
class ControladorGeneral {
        var tamagochi: Tamagochi
    
    var estado: EstadosTamagochi = .Neutro
    
    var hambre: Int {
        get { tamagochi.hambre }
        set { tamagochi.hambre = min(100, max(0, newValue)) }
    }

    var cansancio: Int {
        get { tamagochi.cansancio }
        set { tamagochi.cansancio = min(100, max(0, newValue)) }
    }

    var aburrido: Int {
        get { tamagochi.aburrido }
        set { tamagochi.aburrido = min(100, max(0, newValue)) }
    }

    var limpio: Int {
        get { tamagochi.limpio }
        set { tamagochi.limpio = min(100, max(0, newValue)) }
    }
        
    init(tamagochi_a_cargar: Tamagochi? = nil) {
        if let tamagochi_a_cargar = tamagochi_a_cargar {
            self.tamagochi = tamagochi_a_cargar
        } else {
            self.tamagochi = Tamagochi(
                nombre: "Ramiro", esta_vivo: true,
                edad: 0, hambre: 50, cansancio: 50,
                limpio: 100, aburrido: 20, enojado: 0
            )
        }
    }
    
    func cambiar_nombre(_ nombre_nuevo: String) -> Bool {
        if tamagochi.esta_vivo {
            tamagochi.nombre = nombre_nuevo
        }
        return tamagochi.esta_vivo
    }
    
    func matar() -> Bool {
        if tamagochi.esta_vivo {
            tamagochi.esta_vivo = false
            estado = .Muerto
            return true
        }
        return false
    }
    
    func revivir() -> Bool {
        if !tamagochi.esta_vivo {
            tamagochi.esta_vivo = true
            tamagochi.hambre = 50
            tamagochi.cansancio = 50
            tamagochi.aburrido = 50
            tamagochi.limpio = 50
            tamagochi.enojado = 0
            estado = .Neutro
            return true
        }
        return false
    }
    
    func actualizar_medidores() -> Bool {
        guard tamagochi.esta_vivo else { return false }

        self.hambre += 10
        self.aburrido += 10
        self.cansancio += 10
        self.limpio -= 10

        actualizar_estado()
        return true
    }
    
    func actualizar_estado() {
        if !tamagochi.esta_vivo {
            estado = .Muerto
            return
        }
        
        switch estado {
        case .Neutro:
            if tamagochi.hambre > 60 {
                estado = .Hambriento
            } else if tamagochi.cansancio > 80 {
                estado = .Adormilado
            }
        case .Hambriento:
            if tamagochi.hambre > 80 {
                estado = .Inanicion
            } else if tamagochi.hambre < 40 {
                estado = .Neutro
            }
        case .Inanicion:
            if tamagochi.hambre >= 100 {
                estado = .Muerto
                tamagochi.esta_vivo = false
            } else if tamagochi.hambre < 80 {
                estado = .Hambriento
            }
        case .Comiendo:
            if tamagochi.hambre > 60 {
                estado = .Hambriento
            } else {
                estado = .Neutro
            }
        case .Enojado:
            if tamagochi.enojado < 50 {
                estado = .Neutro
            }
        default:
            return
        }
    }
    
    func adormilar() -> Bool {
        if tamagochi.esta_vivo {
            self.cansancio -= 20
            actualizar_estado()
            return true
        }
        return false
    }
    
    func enojar() -> Bool {
        if tamagochi.esta_vivo {
            tamagochi.enojado -= 20
            actualizar_estado()
            return true
        }
        return false
    }
    
    func alimentar() -> Bool {
        guard tamagochi.esta_vivo else { return false }

        self.hambre -= 20
        estado = .Comiendo
        actualizar_estado()
        return true
    }
    
    func entretener() -> Bool {
        guard tamagochi.esta_vivo else { return false }

        self.aburrido -= 20
        estado = .Feliz
        actualizar_estado()
        return true
    }
    
    func darle_sape() -> Bool {
        guard tamagochi.esta_vivo else { return false }

        tamagochi.enojado += 20
        if tamagochi.enojado > 100 { tamagochi.enojado = 100 }
        
        estado = .Enojado
        actualizar_estado()
        return true
    }
}
