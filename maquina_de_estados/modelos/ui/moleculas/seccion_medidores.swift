//
//  seccion_medidores.swift
//  maquina_de_estados
//
//  Created by alumno on 10/5/26.
//

import SwiftUI

struct SeccionMedidores: View {
    @Environment(ControladorGeneral.self) var controlador

    var body: some View {
        @Bindable var controladorBindable = controlador

        VStack(spacing: 12) {
            Text("Estadísticas")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            BarraEstado(
                titulo: "Hambre",
                color: .orange,
                valor: $controladorBindable.hambre
            )

            BarraEstado(
                titulo: "Cansancio",
                color: .blue,
                valor: $controladorBindable.cansancio
            )

            BarraEstado(
                titulo: "Aburrimiento",
                color: .purple,
                valor: $controladorBindable.aburrido
            )

            BarraEstado(
                titulo: "Higiene",
                color: .green,
                valor: $controladorBindable.limpio
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

#Preview {
    SeccionMedidores()
        .environment(ControladorGeneral())
}
