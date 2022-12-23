//
//  CustomDataBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 21.12.2022.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID()
    let displayName: String
    let userName: String
    let followerCount: Int
    var isVerified: Bool
}

struct CustomDataBootcamp: View {
    @State private var users = [
      //  "Nick", "Emily", "Samantha", "Chris"
        UserModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true), UserModel(displayName: "Emily", userName: "em", followerCount: 55, isVerified: false), UserModel(displayName: "Samentha", userName: "Samm", followerCount: 78, isVerified: true)
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Users")
        }
    }
}

struct CustomDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomDataBootcamp()
    }
}
