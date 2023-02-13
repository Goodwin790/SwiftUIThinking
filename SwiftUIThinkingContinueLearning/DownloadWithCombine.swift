//
//  DownloadWithCombine.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 09.02.2023.
//
import Combine
import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
       // Combine discussion
        /*
        //1 Sign up for monthly subscription for package to be delivered
        //2 The company would make the package behind the scene
        //3 Receive the package at your front door
        //4 Make sure the box isn't damaged
        //5 Open and make sure the item is correct
        //6 use the item!!!!!
        //7 Cancellable at any time!!
         
         //1 Create the publisher
         //2 Subscribe publisher on background thread
         //3 Receive on main thread
         //4 tryMap (Check that the data is good)
         //5 Decode (Decode data into PostModels)
         //6 Sink (Put the item into our app)
         //7 store (cancel subscription if needed)
*/
        
        //1 Create the publisher
        URLSession.shared.dataTaskPublisher(for: url)// This row automatically in background thread
        //2 Subscribe publisher on background thread
            .subscribe(on: DispatchQueue.global(qos: .background))
        
        //3 Receive on main thread
            .receive(on: DispatchQueue.main)
        
        //4 tryMap (Check that the data is good)
            .tryMap(handleOutput)
          
        //5 Decode (Decode data into PostModels)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
 
        //6 Sink (Put the item into our app)
            .sink(receiveValue: { [weak self] returnedPosts in
                self?.posts = returnedPosts
            })
//            .sink { completion in
//            } receiveValue: { [weak self] returnedPosts in
//                self?.posts = returnedPosts
//            }
//
        //7 store (cancel subscription if needed)
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}

struct DownloadWithCombine: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct DownloadWithCombine_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombine()
    }
}
