//
//  Post.swift
//  URL_REST_MVVM_swiftUI
//
//  Created by Daniel on 07/09/22.
//
//modelo datos
import Foundation

struct Post: Codable, Hashable, Identifiable {
    let id = UUID()
    //ESTO SE HACE PARA PODER VER LOS DATOS EN LA LISTA DE SWIFTUI
    let title: String
    let body: String
    
}
