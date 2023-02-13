//
//  TypeAliasBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 07.02.2023.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypeAliasBootcamp: View {
   // @State private var item: MovieModel = MovieModel(title: "Tetle", director: "Joe", count: 5)
    
    @State private var item: TVModel = TVModel(title: "TV show", director: "Emily", count: 50)
    
    var body: some View {
        VStack  {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypeAliasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypeAliasBootcamp()
    }
}
