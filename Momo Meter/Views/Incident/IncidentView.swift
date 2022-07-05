//
//  IncidentView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 05/07/22.
//

import SwiftUI

struct IncidentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var incidents: FetchedResults<Incident>
    
    var body: some View {
        VStack {
            Spacer(minLength: 30)
            
            Rectangle()
                .frame(width: 350, height: 200, alignment: .center)
                .cornerRadius(15)
            
            Spacer(minLength: 20)
            
            Button {
                //MARK:- Add
                
            } label: {
                Text("Add Incident")
                    .font(.title2)
                    .padding()
                    .frame(width: 330, height: 50, alignment: .center)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            
            Spacer(minLength: 20)
            
            List {
                ForEach(0...10, id: \.self) { test in
                    Text("Test")
                }
            }
            .listStyle(.inset)
        }
        .navigationBarHidden(true)
    }
}

//struct IncidentView_Previews: PreviewProvider {
//    static var previews: some View {
//        IncidentView()
//    }
//}
