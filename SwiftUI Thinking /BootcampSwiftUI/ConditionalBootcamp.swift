//
//  ConditionalBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 16.12.2022.
//

import SwiftUI

struct ConditionalBootcamp: View {
    @State private var showCircle = false
    @State private var showRectangle = false
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Is loading: \(isLoading.description)".uppercased()) {
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView()
            }
            
//            Button("Circle button \(showCircle.description)") {
//                showCircle.toggle()
//            }
//
//            Button("Rectangle button: \(showRectangle.description)") {
//                showRectangle.toggle()
//            }
//
//            if showCircle {
//                Circle()
//                    .frame(width: 100, height: 100)
//            }
//
//            if showRectangle {
//                Rectangle()
//                    .frame(width: 100, height: 100)
//            }
//            if showCircle || showRectangle {
//                RoundedRectangle(cornerRadius: 25)
//                    .frame(width: 200, height: 100)
//            }
//
//
//            Spacer()
        }
    }
}

struct ConditionalBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalBootcamp()
    }
}
