//
//  pantalla_usuario.swift
//  maquina_de_estados
//
//  Created by alumno on 9/7/26.
//
import SwiftUI

struct PantallaInicial: View {
    @Environment(ControladorGeneral.self) var controlador_tamagochi
    
    @State var nombre_nuevo = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Tamagochi")
                        .font(.title)
                        .bold()
                    Text("Estado: \(controlador_tamagochi.estado)")
                    Text("Nombre: \(controlador_tamagochi.tamagochi.nombre)")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.blue.opacity(0.1)))

                MascotaEsado()
                
                SeccionMedidores()
                
                VStack(spacing: 10) {
                    TextField("Nombre nuevo de tu tamagochi", text: $nombre_nuevo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Divider()
                    
                    Button("Cambiar nombre") {
                        _ = controlador_tamagochi.cambiar_nombre(nombre_nuevo)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                VStack(spacing: 20) {
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            _ = controlador_tamagochi.matar()
                        }) {
                            botonesPro(imagen: "hammer.fill", texto: "dale con la pala")
                        }
                        .buttonStyle(.bordered)
                        .tint(.rojito)
                        
                        Button(action: {
                            _ = controlador_tamagochi.revivir()
                        }) {
                            botonesPro(imagen: "heart.fill", texto: "Resucitar")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.verdesito)
                    }
                    
                    Divider()
                    
                    VStack(spacing: 12) {
                        Button(action: {
                            _ = controlador_tamagochi.actualizar_medidores()
                        }) {
                            botonesPro(imagen: "arrow.clockwise", texto: "Actualizar")
                        }
                        .buttonStyle(.bordered)
                        
                        Button(action: {
                            _ = controlador_tamagochi.alimentar()
                        }) {
                            botonesPro(imagen: "fork.knife", texto: "Alimentar")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.azulProPlus)
                        
                        Button(action: {
                            _ = controlador_tamagochi.darle_sape()
                        }) {
                            botonesPro(imagen: "hand.wave.fill", texto: "Darle un sape")
                        }
                        .buttonStyle(.bordered)
                        .tint(.naranjaEM)
                        
                        Button(action: {
                            _ = controlador_tamagochi.entretener()
                        }) {
                            botonesPro(imagen: "gamecontroller.fill", texto: "Entretener")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.purple)
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
}

#Preview {
    PantallaInicial()
        .environment(ControladorGeneral())
}
