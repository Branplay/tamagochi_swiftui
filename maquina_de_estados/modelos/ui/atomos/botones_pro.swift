//
//  botones_pro.swift
//  maquina_de_estados
//
//  Created by alumno on 9/21/26.
//

import SwiftUI


struct botones_pro : View {
    var imagen: String
    var texto: String

    
    var body : some View {
        HStack {
            Image(systemName: "hammer.fill")
            Text("Dale con la pala")
        }
    .buttonStyle(.bordered)
    .tint(.red)
    }
}

#Preview {
    botones_pro(imagen: "placeholder", texto: "placeholder")
}
