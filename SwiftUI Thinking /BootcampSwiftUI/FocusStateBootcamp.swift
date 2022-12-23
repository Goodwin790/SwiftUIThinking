//
//  FocusStateBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 23.12.2022.
//

import SwiftUI

struct FocusStateBootcamp: View {
   // @FocusState private var userNameFocus: Bool
   // @FocusState private var passwordFocus: Bool
    @State private var name  = ""
    @State private var password = ""
    @FocusState private var fieldInFocus: OnboardingField?
    
    enum OnboardingField: Hashable {
        case username, password
    }
    var body: some View {

        VStack(spacing: 30) {
            TextField("Add your name here", text: $name)
                .keyboardType(.default)
                .focused($fieldInFocus, equals: .username)
             //   .focused($userNameFocus)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.gray.brightness(0.3))
            .cornerRadius(10)
            
            SecureField("Add your password here", text: $password)
                .keyboardType(.default)
                .focused($fieldInFocus, equals: .password)
            //    .focused($passwordFocus)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.gray.brightness(0.3))
            .cornerRadius(10)
            
            Button("Sign up ") {
                let userNameIsValid = !name.isEmpty
                let passwordIsValid = !password.isEmpty
                if userNameIsValid && passwordIsValid {
                    print("Sign up")
                } else if userNameIsValid {
                    fieldInFocus = .password
//                    userNameFocus = false
//                    passwordFocus = true
                } else {
                    fieldInFocus = .username
//                    userNameFocus = true
//                    passwordFocus = false
                }
            }
            
//            Button("Focus toggle") {
//                userNameFocus.toggle()
//            }
    }
        .padding(40)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                self.userNameFocus = true
//            }
   //     }
    }
}

struct FocusStateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateBootcamp()
    }
}
