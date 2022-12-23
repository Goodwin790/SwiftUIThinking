//
//  OnAppearBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 21.12.2022.
//

import SwiftUI

struct OnAppearBootcamp: View {
    @State private var myText = "Start text"
    @State private var count = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 250)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: { myText = "This is a new text"})
            }
            .onDisappear(){
                myText = "Ending text"
            }
            .navigationTitle("On appear: \(count)")
        }
    }
}

struct OnAppearBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearBootcamp()
    }
}
