//
//  DownloadingImagesBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 13.02.2023.
//

import SwiftUI

//Codable
//background threads
//weak self
//Combines
//Publishers and subscribers
//FileManager
//NSCache

struct DownloadingImagesBootcamp: View {
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading images")
        }
    }
}

struct DownloadingImagesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesBootcamp()
    }
}
