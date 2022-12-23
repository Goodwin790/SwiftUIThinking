//
//  InitialazerBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 15.12.2022.
//

import SwiftUI

struct InitialazerBootcamp: View {
    let backgroundColor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        if fruit == .apple {
            self.title = "Apples"
            self.backgroundColor = .red
        } else {
            self.title = "Orenges"
            self.backgroundColor = .orange
        }
    }
    
    enum Fruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct InitialazerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            InitialazerBootcamp(count: 55, fruit: .apple)
            InitialazerBootcamp(count: 333, fruit: .orange)
        }
    }
}
