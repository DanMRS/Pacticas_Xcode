//
//  NetworkManager.swift
//  URL_REST_MVVM_swiftUI
//
//  Created by Daniel on 07/09/22.
//
//capa de conexion
import Foundation

class NetworkManager {
    //closure con escape y que devuelva un array con los datos
    func getPosts(completion: @escaping([Post]) -> ())
    {
        //modelo de datos
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("La URL no es correcta y no se ha podido accdeder a ella")
        }
        //data pack
        URLSession.shared.dataTask(with: url){ datos, respuesta, error in
            // aqui va la closure
            
            guard let data = datos, error == nil, let response = respuesta as? HTTPURLResponse else {
                return
            }
            if response.statusCode == 200{
                //aqui serializamos los datos que tengamos
                
                //do try catch es un controlador de errores
                do {
                    
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    //devovler datos
                    DispatchQueue.main.async {
                        completion(posts)
                    }
                    
                } catch let error  {
                    print("ha ocurrido un erro\(error.localizedDescription)")
                }
            }
            //al final del closure poner
        }.resume()
    }
}
