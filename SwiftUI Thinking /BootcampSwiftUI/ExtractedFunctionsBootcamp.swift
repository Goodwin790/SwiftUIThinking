//
//  ExtractedFunctionsBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 16.12.2022.
//

import SwiftUI

struct ExtractedFunctionsBootcamp: View {
    @State private var backgroundColor = Color.pink
    var body: some View {
        ZStack {
            //background
          backgroundColor
                .ignoresSafeArea()
            
            //content
            contentLayer
        }
    }
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            
            Button(action: {buttonPressed()},
                   label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
            })
        }
    }
    
    func buttonPressed() {
        backgroundColor = .yellow
    }
}

struct ExtractedFunctionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedFunctionsBootcamp()
    }
}
