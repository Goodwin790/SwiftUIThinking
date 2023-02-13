//
//  CacheBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 13.02.2023.
//

import SwiftUI

class CacheManager {
    
    static let instance = CacheManager()
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache .countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func add(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
       
        return "Added to cache!"
    }
    
    func remove(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed from cache"
    }
    
    func get(name: String) -> UIImage? {
        imageCache.object(forKey: name as NSString)
    }
}

class CacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var informMessage: String = ""
    let imageName = "Example"
    let manager = CacheManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
      startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let startingImage else { return }
       informMessage =  manager.add(image: startingImage, name: imageName)
    }
    
    func removeFromCache() {
        informMessage = manager.remove(name: imageName)
    }
    
    func getFromCache() {
        
        if let returnedImage = manager.get(name: imageName) {
            cachedImage = returnedImage
            informMessage = "Got image from cache"
        } else {
            informMessage = "Image not found in cache"
        }
    }
    
}

struct CacheBootcamp: View {
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Text(vm.informMessage)
                    .font(.headline)
                    .foregroundColor(.purple)
                
                HStack {
                    
                    Button {
                        vm.saveToCache()
                    } label: {
                        Text("Save to cache")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        vm.removeFromCache()
                    } label: {
                        Text("Delete from cache")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                
                Button {
                    vm.getFromCache()
                } label: {
                    Text("Get from cache")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                if let image = vm.cachedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationTitle("Cache Bootcamp")
        }
    }
}

struct CacheBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CacheBootcamp()
    }
}
