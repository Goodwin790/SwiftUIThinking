//
//  SwipeActionsBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 23.12.2022.
//

import SwiftUI

struct SwipeActionsBootcamp: View {
    @State private var fruits = ["Apple", "Orange", "Banana", "Peach"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
            }
           // .onDelete(perform: delete)
            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                Button("Archive") {
                    
                }
                .tint(.yellow)
                Button("save") {
                    
                }
                .tint(.green)
                Button("junk") {
                    
                }
                .tint(.red)
            }
            
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                Button("Share") {
                    
                }
                .tint(.green)
               
            }
            
        }
    }
    func delete(atOffset: IndexSet) {
        
    }
}

struct SwipeActionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionsBootcamp()
    }
}
