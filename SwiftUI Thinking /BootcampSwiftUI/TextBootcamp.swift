//
//  TextBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 14.12.2022.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("The Text() ".uppercased())
//            .font(.body)
//       //     .fontWeight(.heavy)
//            .bold()
//          //  .underline()
//            .underline(true, color: Color.red)
//            .strikethrough(true, color: .green)
//            .italic()
//            .font(.system(size: 24, weight: .semibold, design: .serif))
      //      .baselineOffset(100)
          //  .kerning(10)
            .multilineTextAlignment(.leading)
            .foregroundColor(.red)
            .frame(width: 200, height: 100, alignment: .trailing)
            .minimumScaleFactor(0.2)
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
