//
//  pantalla_usuario.swift
//  maquina_de_estados
//
//  Created by alumno on 9/7/26.
//
import SwiftUI

struct PantallaInicial: View{
    @State var controlador_tamagochi: ControladorGeneral = ControladorGeneral()
    
    @State var nombre_nuevo = ""
    
    @State var nueva_vida = true
    
    var body: some View{
        Text("Su nombre es: \(controlador_tamagochi.tamagochi.nombre)")
        
        
            if(controlador_tamagochi.tamagochi.esta_vivo){
            Text("Tu tamagochi esta vivo.")
        }
        else {
            Text("Esta muerto")
        }
        
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
        
    }
}

#Preview {
    PantallaInicial()
}
