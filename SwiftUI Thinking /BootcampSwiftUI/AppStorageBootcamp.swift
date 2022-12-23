//
//  AppStorageBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 22.12.2022.
//

import SwiftUI

struct AppStorageBootcamp: View {
  
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add name here")
            if let name = currentUserName {
                Text(name)
                
            }
            
            Button("Save".uppercased()) {
                let name = "Anastasia"
                currentUserName = name
            }
        }
    }
}

struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
