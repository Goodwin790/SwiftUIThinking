//
//  ShapesBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 14.12.2022.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
       // Circle()
        //Ellipse()
       // Capsule(style: .circular)
       // Rectangle()
        RoundedRectangle(cornerRadius: 33)
          //  .fill(.yellow)
         //   .foregroundColor(.pink)
          //  .stroke()
           // .stroke(.red)
           // .stroke(.pink, lineWidth: 5)
//            .stroke(Color.orange, style: StrokeStyle(lineWidth: 44, lineCap: .round,  dash: [70]))
           .trim(from: 0.7, to: 1.0)
          .stroke(.purple, lineWidth: 44)
            .frame(width: 300, height: 200)
    }
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}
