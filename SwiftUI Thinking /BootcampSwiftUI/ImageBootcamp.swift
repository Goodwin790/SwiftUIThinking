//
//  ImageBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 14.12.2022.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
       Image("Example")
          //  .renderingMode(.template)
            .resizable()
            //.aspectRatio(contentMode: .fit)
            //.scaledToFit()
            .scaledToFit()
            .frame(width: 300, height: 200)
            .foregroundColor(.yellow)
//          //  .clipped()
//           // .cornerRadius(150)
//            .clipShape(
//               // Circle()
//                Ellipse()
//            )
        
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
