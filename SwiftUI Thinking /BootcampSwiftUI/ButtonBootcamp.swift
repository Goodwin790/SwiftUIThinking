//
//  ButtonBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 16.12.2022.
//

import SwiftUI

struct ButtonBootcamp: View {
  @State  var title: String = "This is my title"
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
            
            Button("Press me!") {
                title = "Button was pressed"
            }
            .accentColor(.red)
        
        
        Button(action: {self.title = "Button 3"},
               label: {Circle()
                .fill(.white)
                .frame(width: 75, height: 75)
                .shadow(radius: 10)
                .overlay(
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                )
        })
            Button(action: {title = "Button 4"},
                   label: {Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                    Capsule()
                        .stroke(.gray, lineWidth: 2)
                    )
            })
        }
    }
}

struct ButtonBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBootcamp()
    }
}
