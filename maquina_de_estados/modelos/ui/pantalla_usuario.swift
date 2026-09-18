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
    
    var body: some View {
        VStack(spacing: 20) {
            
            // 📝 Información principal
            VStack(alignment: .leading, spacing: 8) {
                Text("Tamagochi")
                    .font(.title)
                    .bold()
                
                Text("Nombre: \(controlador_tamagochi.tamagochi.nombre)")
                Text("Hambre: \(controlador_tamagochi.tamagochi.hambre)")
                Text("Limpio: \(controlador_tamagochi.tamagochi.limpio)")
                Text("Cansancio: \(controlador_tamagochi.tamagochi.cansancio)")
                Text("Edad: \(controlador_tamagochi.tamagochi.edad)")
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.blue.opacity(0.1)))
            
            MascotaEsado()
            
            VStack(spacing: 10) {
                TextField("Nombre nuevo de tu tamagochi", text: $nombre_nuevo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Cambiar nombre") {
                    controlador_tamagochi.tamagochi.esta_vivo = true
                    controlador_tamagochi.cambiar_nombre(nombre_nuevo)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
            VStack(spacing: 20) {
                
                // ⚔️ Acciones críticas
                HStack(spacing: 16) {
                    Button(action: {
                        controlador_tamagochi.matar()
                    }) {
                        HStack {
                            Image(systemName: "hammer.fill")
                            Text("Dale con la pala")
                        }
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)
                    
                    Button(action: {
                        controlador_tamagochi.revivir()
                    }) {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("Resucitar")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }
                
                Divider()
                
                // 🍽️ Acciones de cuidado
                VStack(spacing: 12) {
                    Button(action: {
                        controlador_tamagochi.actualizar_medidores()
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("Actualizar")
                        }
                    }
                    .buttonStyle(.bordered)
                    
                    Button(action: {
                        controlador_tamagochi.alimentar()
                    }) {
                        HStack {
                            Image(systemName: "fork.knife")
                            Text("Alimentar")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                    Button(action: {
                        let comando = ComandoTamagochi.darle_un_sape
                        controlador_tamagochi.procesar_comando(comando)
                    }) {
                        HStack {
                            Image(systemName: "hand.wave.fill")
                            Text("Darle un sape")
                        }
                    }
                    .buttonStyle(.bordered)
                    .tint(.orange)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.green.opacity(0.1))
            )

        }
        .padding()
    }

}

#Preview {
    PantallaInicial()
        .environment(ControladorGeneral())
}
