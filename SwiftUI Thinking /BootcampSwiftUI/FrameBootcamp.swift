//
//  FrameBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 14.12.2022.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
       
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(.red)
            .frame(height: 100, alignment: .top)
            .background(.orange)
            .frame(width: 150)
            .background(.purple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.blue)
            .frame(height: 400)
            .background(. pink)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(.yellow)

    }
}

struct FrameBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FrameBootcamp()
    }
}
