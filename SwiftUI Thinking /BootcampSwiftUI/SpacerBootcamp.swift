//
//  SpacerBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 15.12.2022.
//

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
        VStack {
            HStack(spacing: 0){
                Image(systemName: "xmark")
                
                Spacer()
                 
                
                Image(systemName: "gear")
          
            }
            .font(.title)
           // .background(.yellow)
               .padding(.horizontal)
          // .background(.blue)
            
            Spacer()
           
            
            Rectangle()
                .frame(height: 55)
        }

    }
}

struct SpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBootcamp()
    }
}
