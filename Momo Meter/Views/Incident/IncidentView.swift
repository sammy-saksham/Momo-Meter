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
    
    @State private var showFightSheet: Bool = false
    @State private var showCutinessSheet: Bool = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 30)
            
            Rectangle()
                .frame(width: 350, height: 200, alignment: .center)
                .cornerRadius(15)
            
            Spacer(minLength: 15)
            
            HStack {
                Button {
                    //MARK:- Add
                    showFightSheet.toggle()
                } label: {
                    Text("Add Fight")
                        .font(.title2)
                        .padding()
                        .frame(width: 165, height: 50, alignment: .center)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                
                Button {
                    //MARK:- Add
                    showCutinessSheet.toggle()
                } label: {
                    Text("Add Cutiness")
                        .font(.title2)
                        .padding()
                        .frame(width: 165, height: 50, alignment: .center)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
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
        .sheet(isPresented: $showFightSheet) {
            AddFightView(isShowing: $showFightSheet)
        }
        .sheet(isPresented: $showCutinessSheet) {
            AddCutinessView(isShowing: $showCutinessSheet)
        }

    }
}

//struct IncidentView_Previews: PreviewProvider {
//    static var previews: some View {
//        return IncidentView().environment(\.managedObjectContext, DataController().container.viewContext)
//    }
//}
