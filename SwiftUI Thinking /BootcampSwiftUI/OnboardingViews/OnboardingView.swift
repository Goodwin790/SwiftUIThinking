//
//  OnboardingView.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 22.12.2022.
//

import SwiftUI

struct OnboardingView: View {
    // Onboarding states
    /*
     0 - welcome screen
     1 - add name
     2 - add age
     3 - add gender
     */
    
    @State private var onBoardingState = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    // Enboarding inputs
    @State private var name = ""
    @State private var age = 18.0
    @State private var gender = ""
    
    //For the alert
    @State private var alertTitle = ""
    @State private var showAlert = false
    
//App storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            //content
            ZStack {
                switch onBoardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }
            
            //buttons
            VStack {
                Spacer()
       bottomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle))
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(.purple)
    }
}


//MARK: COMPONENTS
extension OnboardingView {
    
    private var bottomButton: some View {
        Text(onBoardingState == 0 ? "SIGN UP" :
                onBoardingState == 3 ? "FINISH" :
        "NEXT")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(10)
            .animation(nil)
            .onTapGesture {
               handleNextButtonPressed()
        }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
        Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight((.semibold))
                .foregroundColor(.white)
                .overlay(
                Capsule()
                    .frame(height: 3)
                .offset(y: 5)
                .foregroundColor(.white),
                alignment: .bottom
                )
            Text("This is the #1 app for findingyour match online! In this tutorial we are practicing using AppStorage and other swiftUI technigues.")
                .font(.body)
                .foregroundColor(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight((.semibold))
                .foregroundColor(.white)
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight((.semibold))
                .foregroundColor(.white)
            Text(String(format: "%.0f", age))
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Slider(value: $age, in: 18...100, step:1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
    }
    
    private var addGenderSection: some View {
    return    VStack(spacing: 20) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight((.semibold))
                .foregroundColor(.white)
            Picker(selection: $gender) {
                Text("Male").tag("Male")
                    .foregroundColor(.white)
                Text("Female").tag("Female")
                    .foregroundColor(.white)
            } label: {
                Text(gender.count > 1 ? gender : "Select a gender")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
            }
            .pickerStyle(.wheel)
            Spacer()
            Spacer()
        }
    }
}

//MARK: FUNCTIONS

extension OnboardingView {

    func handleNextButtonPressed() {
        // Check inputs
        switch onBoardingState {
        case 1:
            guard name.count >= 3 else {
              showAlert(title: "Your name must be at least 3 characters long! 😩")
                return
            }
            
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forvard! 😨")
                return
            }
        default:
            break
        }
        
        
        //Go to next section
        if onBoardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) {
                onBoardingState += 1
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
