//
//  ArraysBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 26.01.2023.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFiltereedArray()
    }
    
    func updateFiltereedArray() {
        //sort
        //*
        //        filteredArray = dataArray.sorted { user1, user2 in
        //            return user1.points > user2.points
        //}
        //            filteredArray = dataArray.sorted(by: {$0.points > $1.points})
        //*
      
        //filter
        /*
        filteredArray = dataArray.filter({(user) -> Bool in
            return user.isVerified
        })
        
        filteredArray = dataArray.filter({$0.isVerified})
         */
        //map
        /*
//        mappedArray = dataArray.map({ user in
//            user.name ?? "Error"
//        })
//
//        mappedArray = dataArray.map({ $0.name })
        
//        mappedArray = dataArray.compactMap({ user in
//            user.name
//        })
        
//        mappedArray = dataArray.compactMap({ $0.name })
        */
        
        let sort = dataArray.sorted(by: { $0.points > $1.points })
        let filter = dataArray.filter({ $0.isVerified })
        let map = dataArray.compactMap({ $0.name })
        
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap({ $0.name })
    }
    func getUsers() {
        let user1 = UserModel(name: "Goodwin", points: 100, isVerified: true)
        let user2 = UserModel(name: "Nick", points: 1, isVerified: true)
        let user3 = UserModel(name: "Chris", points: 20, isVerified: false)
        let user4 = UserModel(name: nil, points: 50, isVerified: true)
        let user5 = UserModel(name: "Amanda", points: 33, isVerified: true)
        let user6 = UserModel(name: "Crissy", points: 47, isVerified: false)
        let user7 = UserModel(name: "Arnold", points: 83, isVerified: true)
        let user8 = UserModel(name: nil, points: 44, isVerified: false)
        let user9 = UserModel(name: "Silvester", points: 52, isVerified: false)
        let user10 = UserModel(name: "Tweety", points: 59, isVerified: true)

        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        
        ])

    }
    
}

struct ArraysBootcamp: View {
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                       Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
