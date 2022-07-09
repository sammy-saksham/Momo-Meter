//
//  IncidentView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 05/07/22.
//

import SwiftUI
import SwiftUICharts

struct IncidentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var incidents: FetchedResults<Incident>
    
    @State private var showFightSheet: Bool = false
    @State private var showCutinessSheet: Bool = false
    
    @State private var categoryIsFight: Bool = true
    
    var body: some View {
        VStack {
            ChartView(DataPoints: populate(category: categoryIsFight ? "Fight" : "Cutiness"), category: categoryIsFight ? "Fight" : "Cutiness")
                .padding()
                .onTapGesture {
                    withAnimation {
                        categoryIsFight.toggle()
                    }
                }
                .transition(.scale)
                .animation(.easeInOut)
            
            HStack {
                Button {
                    showFightSheet.toggle()
                } label: {
                    Text("Add Fight")
                        .font(.title2)
                        .padding(.horizontal)
                        .frame(width: 165, height: 50, alignment: .center)
                        .background(LinearGradient(gradient: Gradient(colors: categoryIsFight ? [Color.red, Color.orange] : [Color.green, Color.teal]), startPoint: .topTrailing, endPoint: .bottomLeading))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                
                Button {
                    showCutinessSheet.toggle()
                } label: {
                    Text("Add Cutiness")
                        .font(.title2)
                        .padding(.horizontal)
                        .frame(width: 165, height: 50, alignment: .center)
                        .background(LinearGradient(gradient: Gradient(colors: categoryIsFight ? [Color.red, Color.orange] : [Color.green, Color.teal]), startPoint: .topTrailing, endPoint: .bottomLeading))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
            
            Spacer(minLength: 20)
            
            List {
                ForEach(incidents, id: \.self) { incident in
                    IncidentItemView(incident: incident)
                        .cornerRadius(15)
                        .listRowSeparator(.hidden)
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
    
    func populate(category: String) -> [Double] {
        var monthTotals: [Double] = [0,0,0,0,0,0,0,0,0,0,0,0]
        
        for incident in incidents {
            if(incident.type == category) {
                let components = Calendar.current.dateComponents([.month, .year], from: incident.occuredOn!)
                let month = components.month ?? 0
                let year = components.year ?? 0
                
                if (year == Calendar.current.component(.year, from: Date())) {
                    monthTotals[month] += 1
                }
            }
        }
        
        return monthTotals
    }
}

//struct IncidentView_Previews: PreviewProvider {
//    static var previews: some View {
//        return IncidentView().environment(\.managedObjectContext, DataController().container.viewContext)
//    }
//}
