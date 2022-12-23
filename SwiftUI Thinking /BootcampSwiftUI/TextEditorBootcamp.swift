//
//  TextEditorBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 19.12.2022.
//

import SwiftUI

struct TextEditorBootcamp: View {
@State private var text = ""
    @State private var savedText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $text)
                    .frame(height: 250)
                    .foregroundColor(.red)
                
                Button {
                    save()
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }
                
                Text(savedText)
                
                        Spacer()
            }
            .padding()
            .background(.yellow)
            .navigationTitle("TextEditor")
        }
    }
    func save() {
        savedText = text
    }
}

struct TextEditorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootcamp()
    }
}
