//
//  PaddingAndSpacerBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 15.12.2022.
//

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
            .fontWeight(.semibold)
            
            Text("this is the description of what we will do on thos screen. It is multiple lines and we will align the text to the leading edge.")
            
        }
 
        .padding()
        .background(
            Color.white
                .shadow(color: .black.opacity(0.3)
                        , radius: 10
                        , x: 10
                        , y: 10)
        )
        .padding(.horizontal, 10)
     
    }
}

struct PaddingAndSpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingAndSpacerBootcamp()
    }
}
