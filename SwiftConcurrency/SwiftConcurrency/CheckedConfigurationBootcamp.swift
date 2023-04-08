//
//  CheckedConfigurationBootcamp.swift
//  SwiftConcurrency
//
//  Created by Сергей Киров on 01.04.2023.
//

import SwiftUI

class CheckedConfigurationBootcampNetworkManager {
    
    func getData(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch  {
            throw error
        }
    }
    
    func getData2(url: URL) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    continuation.resume(returning: data)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }
            .resume()
        }
    }
    
    func getHeartImageFromDataBase(completionHandler: @escaping (_ image: UIImage) -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completionHandler(UIImage(systemName: "heart.fill")!)
        }
    }
    
    func getHeartImageFromDataBase() async -> UIImage {
        await withCheckedContinuation { continuation in
            getHeartImageFromDataBase { image in
                continuation.resume(returning: image)
            }
        }
    }
    
}

class CheckedConfigurationBootcampViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let networkManager = CheckedConfigurationBootcampNetworkManager()
    
    func getImage() async {
        guard let url = URL(string: "https://picsum.photos/300") else { return }
        do {
            let data = try await networkManager.getData2(url: url)
            if let image = UIImage(data: data) {
                await MainActor.run(body: {
                    self.image = image
                })
            }
        } catch  {
            print(error)
        }
    }
    
    func getHeartImage() async {
        let image = await networkManager.getHeartImageFromDataBase()
        self.image = image
    }
    
}

struct CheckedConfigurationBootcamp: View {
    
    @StateObject private var viewModel = CheckedConfigurationBootcampViewModel()
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
//            await viewModel.getImage()
            await viewModel.getHeartImage()
        }
    }
}

struct CheckedConfigurationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CheckedConfigurationBootcamp()
    }
}
