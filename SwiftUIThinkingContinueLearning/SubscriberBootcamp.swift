//
//  SubscriberBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 10.02.2023.
//

import Combine
import SwiftUI

class SubscribeerViewModel: ObservableObject {
    
    @Published var count = 0
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText = ""
    @Published var textIsValid = false
    
    @Published var showButton = false
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
           // .assign(to: \.textIsValid, on: self)
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
       Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
                
//                if self.count >= 10 {
//                    for item in self.cancellables {
//                        item.cancel()
//                    }
//                }
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink{ [weak self] (isValid, count) in
                guard let self = self else { return }
                if isValid && count >= 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
        }
            .store(in: &cancellables)
    }
}

struct SubscriberBootcamp: View {
    @StateObject var vm = SubscribeerViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            Text(vm.textIsValid.description)
            
            TextField("Type something here...", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
                .overlay(
                    ZStack {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0 :
                                vm.textIsValid ? 0 : 1)
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(vm.textIsValid ? 1 : 0)
                    }
                        .font(.title)
                        .padding(.trailing),
                    alignment: .trailing
                    )
            
            Button {
                print("Button is tapped")
            } label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .opacity(vm.showButton ? 1 : 0.5)
            }
            .disabled(!vm.showButton)

        }
        .padding()
    }
}

struct SubscriberBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberBootcamp()
    }
}
