//
//  IconsBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 14.12.2022.
//

import SwiftUI

struct IconsBootcamp: View {
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
            .font(.largeTitle)
         //   .resizable()
            //.aspectRatio(contentMode: .fit)
            //.font(.system(size: 200))
            //.scaledToFit()
            .scaledToFill()
           // .foregroundColor(.red)
            .frame(width: 300, height: 300)
            //.clipped()
    }
}

struct IconsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IconsBootcamp()
    }
}
