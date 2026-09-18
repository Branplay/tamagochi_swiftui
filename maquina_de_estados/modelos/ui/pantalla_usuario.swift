//
//  pantalla_usuario.swift
//  maquina_de_estados
//
//  Created by alumno on 9/7/26.
//
import SwiftUI

struct PantallaInicial: View{
    @Environment(ControladorGeneral.self) var controlador_tamagochi
    
    @State var nombre_nuevo = ""
    
    var body: some View{
        
        
        Text("Su nombre es: \(controlador_tamagochi.tamagochi.nombre)")
        
        Text("Hambre: \(controlador_tamagochi.tamagochi.hambre)")
        Text("Limpio: \(controlador_tamagochi.tamagochi.limpio)")
        Text("Cansancio: \(controlador_tamagochi.tamagochi.cansancio)")
        Text("Edad: \(controlador_tamagochi.tamagochi.edad)")
        MascotaEsado()
        

        TextField("place: holder: Nombre nuevo de tu tamagochi", text: $nombre_nuevo)
        Button("cambiar nombre"){
            controlador_tamagochi.tamagochi.esta_vivo = true
            controlador_tamagochi.cambiar_nombre(nombre_nuevo)
        }
        
        HStack{
            Button("Dale con la pala"){
                controlador_tamagochi.matar()
                
            }
            
            Spacer()
            
            Button("Resucitar"){
                controlador_tamagochi.revivir()
            }
        }
        
        Button ("Actualizar tamagochi"){
            controlador_tamagochi.actualizar_medidores()
        }
        
        Button("Alimentar"){
            controlador_tamagochi.alimentar()
        }
        
        Button("Darle un sape"){
            let comando = ComandoTamagochi.darle_un_sape
            controlador_tamagochi.procesar_comando(comando)
        }
        
    }
}

#Preview {
    PantallaInicial()
        .environment(ControladorGeneral())
}
