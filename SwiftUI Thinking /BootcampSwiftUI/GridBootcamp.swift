//
//  GridBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 15.12.2022.
//

import SwiftUI

struct GridBootcamp: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 6,
                      pinnedViews: [.sectionHeaders],
                      content: {
                Section(header:
                            Text("Section1")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.blue)
                    .padding()
                )
                {
                    
                    
                           ForEach(0..<50) { index in
                               Rectangle()
                                   .frame(height: 150)
                           
                       }
                }
                
                Section(header:
                            Text("Section2")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.red)
                    .padding()
                )
                {
                    
                    
                           ForEach(0..<50) { index in
                               Rectangle()
                                   .fill(.green)
                                   .frame(height: 150)
                           
                       }
                }
            })
        }
    }
}

struct GridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GridBootcamp()
    }
}
