//
//  IfLet&GuardBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 21.12.2022.
//

import SwiftUI

struct IfLet_GuardBootcamp: View {
    @State private var currentUserId: String? = "TestUser"
    @State private var displayText: String?
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we practice a save coding")
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                if isLoading {
                    ProgressView()
                }
                Spacer()
            }
            .onAppear {
                loadData2()
            }
            .navigationTitle("Save coding")
        }
    }
    func loadData() {
        if let userID = currentUserId {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is a new data! UserID: \(userID)"
                isLoading = false
            }
        } else {
            displayText = "Error. There is no User ID!"
        }
    }
    
    func loadData2() {
        guard let userID = currentUserId else {
            displayText = "Error. There is no User ID!"
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is a new data! UserID: \(userID)"
            isLoading = false
        }
    }
}

struct IfLet_GuardBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IfLet_GuardBootcamp()
    }
}
