//
//  CustomButtonStyle.swift
//  AdvancedLearning
//
//  Created by Сергей Киров on 26.04.2023.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat = 0.9) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
//        self.
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct CustomButtonStyle: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click me")
                .withDefaultButtonFormatting()
        }
        .withPressableStyle(scaledAmount: 1.2)
//        .buttonStyle(PressableButtonStyle())
        .padding(40)

    }
}

struct CustomButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonStyle()
    }
}
