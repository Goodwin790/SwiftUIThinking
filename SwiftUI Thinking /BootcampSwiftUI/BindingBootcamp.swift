//
//  BindingBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 16.12.2022.
//

import SwiftUI

struct BindingBootcamp: View {
    @State private var backgroundColor = Color.green
    @State private var title = "Title"
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            ButtonView(backgroundColor: $backgroundColor, title: $title)
        }
    }
}


struct ButtonView: View {
    @Binding var backgroundColor: Color
    @State private var buttonColor: Color = .blue
    @Binding var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(.white)
            
            Button(action: {
                backgroundColor = .orange
                buttonColor = .pink
                title = "New title!!!!!!"
            },
                   label: {
                Text("Button")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(buttonColor)
                    .cornerRadius(10)
            })
        }
    }
}

struct BindingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BindingBootcamp()
    }
}
