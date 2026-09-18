//
//  mascota_estado_pantalla.swift
//  maquina_de_estados
//
//  Created by alumno on 9/11/26.
//
import SwiftUI

struct MascotaEsado: View {
    @Environment(ControladorGeneral.self) var mascota
    
    var body: some View {
        switch (mascota.estado) {
        case .Neutro:
            ZStack{
                Rectangle()
                    Image("EstadoBNeutral")
                    .resizable()
                    .scaledToFit()
            }
        case .Hambriento:
            ZStack{
                Rectangle()
                    Image("EstadoBHambriento")
                    .resizable()
                    .scaledToFit()
            }
        case .Inanicion:
            ZStack{
                Rectangle()
                    Image("EstadoBAburrido")
                    .resizable()
                    .scaledToFit()
            }
        case .Muerto:
            ZStack{
                Rectangle()
                    Image("EstadoBAsquiado")
                    .resizable()
                    .scaledToFit()
            }

        default:
            Text("No se que paso")
        }
    }
}

#Preview{
    MascotaEsado()
        .environment(ControladorGeneral())
}
