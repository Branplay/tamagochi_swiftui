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
                    .fill(Color.clear)
                    Image("EstadoBNeutral")
                    .resizable()
                    .scaledToFit()
            }
        case .Hambriento:
            ZStack{
                Rectangle()
                    .fill(Color.clear)
                    Image("EstadoBHambriento")
                    .resizable()
                    .scaledToFit()
            }
        case .Inanicion:
            ZStack{
                Rectangle()
                    .fill(Color.clear)
                    Image("EstadoBAburrido")
                    .resizable()
                    .scaledToFit()
            }
        case .Muerto:
            ZStack{
                Rectangle()
                    .fill(Color.clear)
                    Image("EstadoBAsquiado")
                    .resizable()
                    .scaledToFit()
            }
        case .Adormilado:
            ZStack{
                Rectangle()
                    .fill(Color.clear)
                    Image("EstadoBSueno")
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
