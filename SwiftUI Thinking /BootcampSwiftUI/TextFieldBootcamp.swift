//
//  TextFieldBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 19.12.2022.
//

import SwiftUI

struct TextFieldBootcamp: View {
    @State private var textFieldText = ""
    @State private var textArray = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type someting here",text: $textFieldText)
                   // .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.red)
                .font(.headline)
                
                Button {
                    if textIsAppropriate() {
                    saveText()
                    }
                } label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? .blue : .gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    .font(.headline)
                }
                .disabled(!textIsAppropriate())
                ForEach(textArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Text Field")
        }
    }
    
    func textIsAppropriate() -> Bool {
        textFieldText.count >= 3
    }
    
    func saveText() {
        textArray.append(textFieldText)
        textFieldText = ""
    }
}

struct TextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBootcamp()
    }
}
