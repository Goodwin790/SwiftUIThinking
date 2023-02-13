//
//  DownloadingImageView.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 13.02.2023.
//

import SwiftUI

struct DownloadingImageView: View {
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String, key: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
               Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 75, height: 75)
            }
        }
    }
}

struct DownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImageView(url: "https://via.placeholder.com/600/92c952", key: "1")
            .previewLayout(.sizeThatFits)
    }
}
