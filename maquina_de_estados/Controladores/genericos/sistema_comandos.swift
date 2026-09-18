//
//  sistema_comandos.swift
//  maquina_de_estados
//
//  Created by alumno on 9/18/26.
//

protocol Comando {}

protocol ProcesarComandos{
    func procesar_comando(_ comando: Comando) -> Bool
}
