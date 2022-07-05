//
//  ContentView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 05/07/22.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    @State private var authenticated: Bool = false
    
    private func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Face ID required to access sensitive information") { success, authenticationError in
                if success {
                    authenticated.toggle()
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                    .ignoresSafeArea()
                    .foregroundColor(.accentColor)
                
                VStack {
                    Spacer()
                    
                    Text("Momo Meter")
                        .font(Font.custom("Nunito-Regular", size: 50))
                        .foregroundColor(.white)
                        .bold()
                    
                    Spacer(minLength: 150)
                    
                    Text("This app contains sensitive data about Momo and Sammy")
                        .font(Font.custom("Nunito-Regular", size: 20))
                        .foregroundColor(.white)
                        .bold()
                        .italic()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Text("कृपया दफ़ा हो जाएं")
                        .font(Font.custom("Nunito-Regular", size: 25))
                        .foregroundColor(.white)
                        .bold()
                        .italic()
                        .padding(.horizontal, 20)
                    
                    Spacer(minLength: 200)
                    
                    if authenticated {
                        NavigationLink {
                            IncidentView()
                        } label: {
                            Text("Proceed")
                                .font(.title2)
                                .padding()
                                .frame(width: 330, height: 70, alignment: .center)
                                .background(.white)
                                .cornerRadius(20)
                        }
                    } else {
                        Button {
                            authenticate()
                        } label: {
                            Text("Authenticate")
                                .font(.title2)
                                .padding()
                                .frame(width: 330, height: 70, alignment: .center)
                                .background(.white)
                                .cornerRadius(20)
                        }
                        
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
