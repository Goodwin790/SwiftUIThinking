//
//  DarkModeBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 20.12.2022.
//

import SwiftUI

struct DarkModeBootcamp: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This is primary text")
                        .foregroundColor(.primary)
                    Text("This color is secondary")
                        .foregroundColor(.secondary)
                    Text("This is color black")
                        .foregroundColor(.black)
                    Text("This is color white")
                        .foregroundColor(.white)
                    Text("This color is red")
                        .foregroundColor(.red)
                    Text("This color is globally active")
                        .foregroundColor(Color("AdaptiveColor"))
                    Text("This color is locally adaptive!!!")
                        .foregroundColor(colorScheme == .light ? .green : .yellow)
                }
            }
            .navigationTitle("Dark mode")
        }
    }
}

struct DarkModeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DarkModeBootcamp()
         
    }
}
