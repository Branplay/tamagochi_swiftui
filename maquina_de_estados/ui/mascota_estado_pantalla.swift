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
            Rectangle()
                .foregroundStyle(Color.gray)
        case .Hambriento:
            Rectangle()
                .foregroundStyle(Color.orange)
        case .Inanicion:
            Rectangle()
                .foregroundStyle(Color.red)
        case .Muerto:
            Text("Muerto")
                .fontWidth(.expanded)
                .fontWeight(.heavy)
            
        default:
            Text("No se que paso")
        }
    }
}

#Preview{
    MascotaEsado()
        .environment(ControladorGeneral())
}
