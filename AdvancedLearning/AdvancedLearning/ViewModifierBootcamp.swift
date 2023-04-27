//
//  ViewModifierBootcamp.swift
//  AdvancedLearning
//
//  Created by Сергей Киров on 26.04.2023.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
                    content
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(backgroundColor)
                        .cornerRadius(10)
                        .shadow(radius: 10)
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
    
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello")
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .pink)
            Text("Hellolgkgmj")
                .font(.title2)
                .withDefaultButtonFormatting()

            Text("lykfjflg Hello")
                .font(.caption)
                .modifier(DefaultButtonViewModifier(backgroundColor: .red))
        }
        .padding()
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
