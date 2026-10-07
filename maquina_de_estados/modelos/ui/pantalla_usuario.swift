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
                
                // Encabezado del Estado
                VStack(alignment: .leading, spacing: 8) {
                    Text("Tamagochi")
                        .font(.title)
                        .bold()
                    Text("Estado: \(controlador_tamagochi.estado)")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.blue.opacity(0.1)))

                MascotaEsado()
                
                SeccionMedidores()
                
                VStack(spacing: 10) {
                    TextField("Nombre nuevo de tu tamagochi", text: $nombre_nuevo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
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
                            botones_pro(imagen: "hammer.fill", texto: "dale con la pala")
                        }
                        .buttonStyle(.bordered)
                        .tint(.red)
                        
                        Button(action: {
                            _ = controlador_tamagochi.revivir()
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
                    
                    VStack(spacing: 12) {
                        Button(action: {
                            _ = controlador_tamagochi.actualizar_medidores()
                        }) {
                            HStack {
                                Image(systemName: "arrow.clockwise")
                                Text("Actualizar")
                            }
                        }
                        .buttonStyle(.bordered)
                        
                        Button(action: {
                            _ = controlador_tamagochi.alimentar()
                        }) {
                            HStack {
                                Image(systemName: "fork.knife")
                                Text("Alimentar")
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        
                        Button(action: {
                            _ = controlador_tamagochi.darle_sape()
                        }) {
                            HStack {
                                Image(systemName: "hand.wave.fill")
                                Text("Darle un sape")
                            }
                        }
                        .buttonStyle(.bordered)
                        .tint(.orange)
                        
                        Button(action: {
                            _ = controlador_tamagochi.entretener()
                        }) {
                            HStack {
                                Image(systemName: "gamecontroller.fill")
                                Text("Entretener")
                            }
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
