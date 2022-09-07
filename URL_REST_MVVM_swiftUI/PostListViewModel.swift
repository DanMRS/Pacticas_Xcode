//
//  PostListViewModel.swift
//  URL_REST_MVVM_swiftUI
//
//  Created by Daniel on 07/09/22.
//

import Foundation
import Combine

class PostListViewModel: ObservableObject{
    
    init() {
        obtenerPost()
    }
    
    @Published var posts = [Post] () {
        didSet {
            didchange.send(self)
        }
    }
    //importar esto de combine
    //crea un emisor que le esta pidiendo datos
    let didchange = PassthroughSubject<PostListViewModel, Never>()
    
    //usar combine programacion declarativa
    func obtenerPost(){
        //comunicar con capa de conexion
        NetworkManager().getPosts { (post) in
            //voy a asignar lo que traigo de la capa de conexion a una propiedad de viewmodel
            self.posts = post
            
        }
    }
}
