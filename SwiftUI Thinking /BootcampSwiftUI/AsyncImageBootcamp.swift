//
//  AsyncImageBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 23.12.2022.
//

import SwiftUI

/*
 case empty -> No image is loaded.
 case success(Image) -> An image succesfully loaded.
 case failure(Error) -> An image failed to load with an error.
 */

struct AsyncImageBootcamp: View {
    let url = URL(string: "https://picsum.photos/400")
    var body: some View {
        
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let returnedImage):
                returnedImage
                               .resizable()
                               .frame(width: 100, height: 100)
                               .scaledToFit()
                               .cornerRadius(20)
            case .failure:
                Image(systemName: "question")
            default:
                Image(systemName: "question")
            }
        }
        
//        AsyncImage(url: url) { returnedImage in
//            returnedImage
//                .resizable()
//                .frame(width: 100, height: 100)
//                .scaledToFit()
//                .cornerRadius(20)
//        } placeholder: {
//            ProgressView()
//        }
    }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}
