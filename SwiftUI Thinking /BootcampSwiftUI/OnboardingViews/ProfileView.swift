//
//  ProfileView.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 22.12.2022.
//

import SwiftUI

struct ProfileView: View {
   
        @AppStorage("name") var currentUserName: String?
        @AppStorage("age") var currentUserAge: Int?
        @AppStorage("gender") var currentUserGender: String?
        @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(currentUserName ?? "Your name here")
            Text("Age: \(currentUserAge ?? 0) years old")
            Text("Their gender is: \(currentUserGender ?? "Unknown")")
            
            Text("Sign out")
                .background(.black)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .cornerRadius(10)
                .onTapGesture {
                    signOut()
                }
            
        }
        .font(.title)
        .foregroundColor(.primary)
        .padding()
        .padding(.vertical, 40)
        .background(.blue)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
