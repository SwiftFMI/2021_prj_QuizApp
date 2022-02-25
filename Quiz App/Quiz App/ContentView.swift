//
//  ContentView.swift
//  Quiz App
//
//  Created by Denislav's Mac Book on 21.02.22.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            //Success
        })
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password, completion: { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            //Success
            
        })
    }
    func signOut(){
        try? auth.signOut()
        self.signedIn = false

    }

}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                CategoryView()
            }else{
                SignInView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}


struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            VStack{
                Image("quiz-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .rotationEffect(.degrees(-18.0))
                VStack{
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .opacity(0.4)
                        .cornerRadius(8)
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .opacity(0.4)
                        .cornerRadius(8)
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.signIn(email: email, password: password)
                        
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .opacity(0.8)
                            .cornerRadius(8)
                    })
                    NavigationLink("Create Account", destination: SignUpView())
                        .padding()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.yellow).ignoresSafeArea()
    }
}

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            VStack{
                Image("quiz-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .rotationEffect(.degrees(-18.0))
                VStack{
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .opacity(0.4)
                        .cornerRadius(8)
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .opacity(0.4)
                        .cornerRadius(8)
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.signUp(email: email, password: password)
                        
                    }, label: {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .opacity(0.8)
                            .cornerRadius(8)
                    })
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.yellow).ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

