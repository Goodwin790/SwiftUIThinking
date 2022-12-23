//
//  TernaryBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 16.12.2022.
//

import SwiftUI

struct TernaryBootcamp: View {
    @State private var isStartingState = false
    
    var body: some View {
        VStack {
            Button("Button \(isStartingState.description)") {
                isStartingState.toggle()
            }
            
            Text(isStartingState ? "Starting state" : "Ending state")
            
            RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
                .fill(isStartingState ? .red : .blue)
                .frame(width: isStartingState ? 200 : 50,
                       height: isStartingState ? 400 : 50)
            
            
            Spacer()
        }
    }
}

struct TernaryBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TernaryBootcamp()
    }
}
