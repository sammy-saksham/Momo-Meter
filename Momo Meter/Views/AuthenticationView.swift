//
//  ContentView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 05/07/22.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var accessApplication: Bool = false
    
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
                            
                        NavigationLink {
                            IncidentView()
                        } label: {
                            Text("Authenticate")
                                .font(.title2)
                                .padding()
                                .frame(width: 330, height: 70, alignment: .center)
                                .background(.white)
                                .cornerRadius(20)
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
