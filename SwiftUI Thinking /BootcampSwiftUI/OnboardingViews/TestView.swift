//
//  TestView.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 23.12.2022.
//

import SwiftUI

struct TestView: View {
    enum Gender {
        case male
        case female
    }
    
    @State var gender: Gender = .male
    
    var body: some View {
        VStack {
            Text("Select a gender")
                .font(.title)
                .frame(maxWidth: .infinity)
                .foregroundColor( .purple)
            
            Picker("", selection: $gender) {
                Text("Male")
                    .tag(Gender.male)
                Text("Female")
                    .tag(Gender.female)
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
