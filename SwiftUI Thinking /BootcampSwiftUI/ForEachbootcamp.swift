//
//  ForEachbootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 15.12.2022.
//

import SwiftUI

struct ForEachbootcamp: View {
    let data: [String] = ["Hi", "Hello", "Hi everyone"]
    let myString = "Hello"
    
    var body: some View {
        VStack {
            ForEach(data.indices) { index in
                Text("\(data[index]): \(index)")
            }
            
            ForEach(0..<100) { index in
                Circle()
                    .frame(height: 50)
            }
        }
    }
}

struct ForEachbootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachbootcamp()
    }
}
