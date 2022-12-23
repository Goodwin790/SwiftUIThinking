//
//  AnimationBootccamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 16.12.2022.
//

import SwiftUI

struct AnimationBootccamp: View {
    @State private var isAnimation = false
    
    var body: some View {
        VStack {
            Button("Button") {
            
                    isAnimation.toggle()

            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimation ? 50 : 25)
                .fill(isAnimation ? .red : .blue)
                .frame(width: isAnimation ? 100 : 300,
                       height: isAnimation ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimation ? 360 : 0))
                .offset(y: isAnimation ? 300 : 0)
            //How it work???
                .animation(.spring().repeatForever(autoreverses: true))
            Spacer()
        }
    }
}

struct AnimationBootccamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBootccamp()
    }
}
