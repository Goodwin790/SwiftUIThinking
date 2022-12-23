//
//  ExtractSubViewsBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 16.12.2022.
//

import SwiftUI

struct ExtractSubViewsBootcamp: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            contentLayer
        }
    }
    var contentLayer: some View {
        HStack {
            MyItem(title: "Apples", count: 1, color: .red)
            MyItem(title: "Orange", count: 10, color: .orange)
            MyItem(title: "Bananas", count: 41, color: .yellow)
        }
    }
}

struct ExtractSubViewsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubViewsBootcamp()
    }
}

struct MyItem: View {
    let title: String
    let count: Int
    let color: Color
    var body: some View {
        VStack{
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
