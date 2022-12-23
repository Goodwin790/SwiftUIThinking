//
//  ContextMenuBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 19.12.2022.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    @State private var backgroundColor = Color.blue
    
    var body: some View {
       NavigationView {
            VStack(alignment: .leading, spacing: 20.0) {
                Image(systemName: "house.fill")
                    .font(.title)
                Text("SwiftUI thinking")
                    .font(.headline)
                Text("How to use contextMenu")
                    .font(.subheadline)
            }
            .foregroundColor(.white)
            .padding(30)
            .background(backgroundColor.cornerRadius(30))
            .contextMenu {
                
                Button {
                    backgroundColor = .yellow
                } label: {
                    Label("Share post", systemImage: "flame.fill")
                }
                Button {
                    backgroundColor = .green
                } label: {
                    Text("Report post")
                }
                
                Button {
                    backgroundColor = .red
                } label: {
                    HStack {
                        Text("like")
                        Image(systemName: "heart.fill")
                    }
                }


        }
        }
    }
}

struct ContextMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootcamp()
    }
}
