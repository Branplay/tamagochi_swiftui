//
//  vista_jjep.swift
//  maquina_de_estados
//
//  Created by alumno on 9/21/26.
//

import SwiftUI

struct vista_jjep: View {
    var texto: String
    var imagen: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color.gray)
                
            HStack{
                Circle()
                    .foregroundStyle(Color.pink)
                Spacer()
                Text(texto)
                Spacer()
                Circle()
                    .foregroundStyle(Color.pink)
            }
            .frame(height: 50)
        }
        .frame( height: 75)
    }
}


#Preview {
    vista_jjep(texto: "Place holder", imagen: "Place holder")
}
