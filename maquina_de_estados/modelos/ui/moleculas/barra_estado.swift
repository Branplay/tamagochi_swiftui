//
//  barra_estado.swift
//  maquina_de_estados
//
//  Created by alumno on 10/5/26.
//
import SwiftUI

struct BarraEstado: View {
    let titulo: String
    let color: Color
    @Binding var valor: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(titulo)
                    .font(.caption)
                    .bold()

                Spacer()

                Text("\(valor)%")
                    .font(.caption)
                    .bold()
            }

            ProgressView(
                value: Double(valor),
                total: 100
            )
            .tint(color)
            .animation(.easeInOut(duration: 0.3), value: valor)
        }
    }
}
