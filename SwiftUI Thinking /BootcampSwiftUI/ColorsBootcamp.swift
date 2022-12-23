//
//  ColorsBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 14.12.2022.
//

import SwiftUI

struct ColorsBootcamp: View {
    var body: some View {
     RoundedRectangle(cornerRadius: 25)
            .fill(
                //.primary
//                Color(UIColor.systemRed)
Color("CustomColor")
            )
             
            .frame(width: 300, height: 200)
           // .shadow(radius: 22)
            .shadow(color: Color("CustomColor").opacity(0.5), radius: 22, x: -22, y: 22)
    }
}

struct ColorsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorsBootcamp()
            
            
    }
}
