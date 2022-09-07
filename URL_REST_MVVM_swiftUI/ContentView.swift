//
//  ContentView.swift
//  URL_REST_MVVM_swiftUI
//
//  Created by Daniel on 06/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = PostListViewModel()
    
    //empaquetadores de propiedades da propiedades reactivas
    
    var body: some View {
        
        List(model.posts){ post in
            Text(post.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
