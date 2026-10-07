//
//  botones_pro.swift
//  maquina_de_estados
//
//  Created by alumno on 9/21/26.
//

import SwiftUI


struct botonesPro : View {
    var imagen: String
    var texto: String

    
    var body : some View {
        HStack {
            Image(systemName: imagen)
            Text(texto)
        }
    .buttonStyle(.bordered)
    .tint(.red)
    }
}

#Preview {
    botonesPro(imagen: "placeholder", texto: "placeholder")
}
