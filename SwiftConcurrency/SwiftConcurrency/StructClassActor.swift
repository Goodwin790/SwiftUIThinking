//
//  StructClassActor.swift
//  SwiftConcurrency
//
//  Created by Сергей Киров on 03.04.2023.
//

import SwiftUI

actor StructClassActorDataManager {
    func getDataFromDataBase() {
        
    }
}

class StructClassActorViewModel: ObservableObject {
    @Published var title: String = ""
    init() {
        print("ViewModel init")
    }
}

struct StructClassActor: View {
    @StateObject private var viewModel = StructClassActorViewModel()
    let isActive: Bool
    
    init(isActive: Bool) {
        self.isActive = isActive
        print("View init")
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(isActive ? Color.red : Color.blue)
            .onAppear {
               // runTest()
            }
    }

}

struct StructClassActorHomeView: View {
    @State private var isActive = false
    var body: some View {
        StructClassActor(isActive: isActive)
            .onTapGesture {
                isActive.toggle()
            }
    }
}

struct StructClassActor_Previews: PreviewProvider {
    static var previews: some View {
        StructClassActor(isActive: true)
    }
}

extension StructClassActor {
    
    private func runTest() {
        print("Test startied!")
        structTest1()
        printDivider()
        classTest1()
        printDivider()
        actorTest1()
//        structTest2()
//        printDivider()
//        classTest2()
    }
    
    private func printDivider() {
        print("""
- - - -- - - - - - - - - - - - - ---  - - - -
""")
    }
    
    private func structTest1() {
        print("Struct test 1")
        let objectA = MyStruct(title: "Starting title")
        print("Object A: ", objectA.title)
        
        print("Pass the VALUES of object A to object B")
        var objectB = objectA
        print("Object B: ", objectB.title)
        
        objectB.title = "Second title"
        print("Object B title changed!")
        
        print("Object A: ", objectA.title)
        print("Object B: ", objectB.title)
        
    }
    
    private func classTest1() {
        print("Class test 1")
        let objectA = MyClass(title: "Starting title")
        print("Object A: ", objectA.title)
        
        print("Pass the REFERENCE of object A to object B")

        let objectB = objectA
        print("Object B: ", objectB.title)

        objectB.title = "Second title"
        print("Object B title changed!")
        
        print("Object A: ", objectA.title)
        print("Object B: ", objectB.title)
        
    }
    
    private func actorTest1() {
        Task {
            print("Actor test 1")
            let objectA = MyActor(title: "Starting title")
            await print("Object A: ", objectA.title)
            
            print("Pass the REFERENCE of object A to object B")

            let objectB = objectA
            await print("Object B: ", objectB.title)

            await objectB.updateTitle(newTitle: "Second title")
            print("Object B title changed!")
            
            await print("Object A: ", objectA.title)
            await print("Object B: ", objectB.title)
        }
        
    }
    
}

struct MyStruct {
    var title: String
}

//Immutable struct
struct CustomStruct {
    let title: String
    
    func updateTitle(newTitle: String) -> CustomStruct {
        CustomStruct(title: newTitle)
    }
}

struct MutatingStruct {
    private(set) var title: String
    
    init(title: String) {
        self.title = title
    }
    
    mutating func updateTitle(newTitle: String) {
        title = newTitle
    }
}


extension StructClassActor {
    private func structTest2() {
        print("struct test 2")
        var struct1 = MyStruct(title: "Title 1")
        print("Struct 1: ", struct1.title)
        struct1.title = "Title 2"
        print("Struct 1: ", struct1.title)
        
        var struct2 = CustomStruct(title: "Title 1")
        print("Struct 2: ", struct2.title)
        struct2 = CustomStruct(title: "Title 2")
        print("Struct 2: ", struct2.title)
        
        var struct3 = CustomStruct(title: "Title 1")
        print("Struct 3: ", struct3.title)
        struct3 = struct3.updateTitle(newTitle: "Title 2")
        
        var struct4 = MutatingStruct(title: "Title 1")
        print("Struct 4: ", struct4.title)
        struct4.updateTitle(newTitle: "Title 2")
        print("Struct 4: ", struct4.title)

    }
}

class MyClass {
    var title: String
    init(title: String) {
        self.title = title
    }
    func updateTitle(newTitle: String) {
        title = newTitle
    }
}

actor MyActor {
    var title: String
    init(title: String) {
        self.title = title
    }
    func updateTitle(newTitle: String) {
        title = newTitle
    }
}

extension StructClassActor {
    
    private func classTest2() {
        print("Class test 2")
        let class1 = MyClass(title: "Title 1")
        print("Class 1: ", class1.title)
        class1.title = "Title 2"
        print("Class 1: ", class1.title)
        
        let class2 = MyClass(title: "Title 1")
        print("Class 2: ", class2.title)
        class2.updateTitle(newTitle: "Title 2")
        print("Class 2: ", class2.title)

    }
    
}
