//
//  NavigationLinkBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 18.12.2022.
//

import SwiftUI

struct NavigationLinkBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
                NavigationLink("Link", destination: MyOtherScreen())
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("all inboxes")
          //  .navigationBarTitleDisplayMode(.automatic)
          //  .navigationBarHidden(true)
            .navigationBarItems(leading:
                                    
                                    HStack {
                Image(systemName: "person.fill")
                Image(systemName: "flame.fill")
            }
                                
                                ,
                                trailing:
                NavigationLink(
                    destination: MyOtherScreen(),
                    label:  { Image(systemName: "gear")
                        
                    })
                    .accentColor(.red)
                )
        }
    }
}

struct MyOtherScreen: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
                .navigationTitle("GreenScreen")
              //  .navigationBarHidden(true)
            
            VStack {
                Button("back") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                NavigationLink("click here", destination: Text("3rd screen"))
            }
        }
    }
}

struct NavigationLinkBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkBootcamp()
    }
}
