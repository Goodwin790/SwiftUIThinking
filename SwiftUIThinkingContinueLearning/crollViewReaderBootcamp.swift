//
//  crollViewReaderBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 21.01.2023.
//

import SwiftUI

struct crollViewReaderBootcamp: View {
    @State private var scrollToIndex = 0
    @State private var textFieldText = String()
    
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 50)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            ScrollView {
                ScrollViewReader { proxy in
                    
                    Button("click here to go to #30") {
                        withAnimation(.spring()) {
                            if let index = Int(textFieldText) {
                                scrollToIndex = index
                            }
                        }
                    }
                    
                    ForEach(0..<50) { index in
                        Text("This is item # \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

struct crollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        crollViewReaderBootcamp()
    }
}
