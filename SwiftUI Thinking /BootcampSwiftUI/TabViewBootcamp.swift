//
//  TabViewBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 20.12.2022.
//

import SwiftUI

struct TabViewBootcamp: View {
    @State private var selectedTab = 0
    let icons: [String] = [
    "heart.fill", "globe", "house.fill", "person.fill"
    ]
    var body: some View {

//        TabView(selection: $selectedTab) {
//            HomeView()
//                .tabItem {
//                    Label("home", systemImage: "house.fill")
//                }
//                .tag("one")
//            Text("Browse tab")
//                .tabItem {
//                Label("browse", systemImage: "globe")
//                }
//                .tag("two")
//        }
        
//        TabView(selection: $selectedTab) {
//            HomeView(selectedTab: $selectedTab)
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("home")
//                }
//                .tag(1)
//
//            Text("Browse tab")
//            .tabItem {
//                Image(systemName: "globe")
//                Text("browse")
//            }
//            .tag(2)
//
//            Text("profile tab")
//            .tabItem {
//                Image(systemName: "person.fill")
//                Text("profile")
//            }
//            .tag(3)
//        }
        
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .background(
            RadialGradient(colors: [.red, .green, .yellow], center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
        .accentColor(.black)
    }
}

struct HomeView: View {
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack{
                Text("Home tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button {
                    selectedTab = 3
                } label: {
                    Text("Go to profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootcamp()
    }
}


