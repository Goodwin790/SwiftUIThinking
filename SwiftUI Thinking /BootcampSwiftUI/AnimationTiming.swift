//
//  AnimationTiming.swift
//  0AddingText
//
//  Created by Сергей Киров on 16.12.2022.
//

import SwiftUI

struct AnimationTiming: View {
    @State private var IsAnimating = false
    let timing = 10.0
    var body: some View {
        VStack {
            Button("Button") {
                IsAnimating.toggle()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: IsAnimating ? 350 : 50 , height: 100)
                .animation(.spring(response: 0.5, dampingFraction: 0.7,
                    blendDuration: 1.0),
                    value: IsAnimating)
     //           .animation(.spring(), value: IsAnimating)
//                .animation(.linear(duration: timing), value: IsAnimating)

//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: IsAnimating ? 350 : 50 , height: 100)
//                .animation(.easeIn(duration: timing), value: IsAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: IsAnimating ? 350 : 50 , height: 100)
//                .animation(.easeInOut(duration: timing), value: IsAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: IsAnimating ? 350 : 50 , height: 100)
//                .animation(.easeOut(duration: timing), value: IsAnimating)
            
                    }
    }
}

struct AnimationTiming_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTiming()
    }
}
