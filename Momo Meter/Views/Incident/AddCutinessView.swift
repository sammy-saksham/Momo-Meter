//
//  AddCutinessView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 06/07/22.
//

import SwiftUI

struct AddCutinessView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Binding var isShowing: Bool
    
    @State private var by: String = "Both"
    @State private var description: String = ""
    @State private var occuredOn: Date = Date.now
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Culprit") {
                        Picker("Culprit", selection: $by) {
                            Text("Sammy").tag("Sammy")
                            Text("Both").tag("Both")
                            Text("Momo").tag("Momo")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Section("Description") {
                        TextEditor(text: $description)
                    }
                    Section("Date & Time") {
                        DatePicker("", selection: $occuredOn)
                            .datePickerStyle(GraphicalDatePickerStyle())
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        if(description != "") {
                            let cutiness = Incident(context: managedObjectContext)
                            
                            cutiness.by = by
                            cutiness.desc = description
                            cutiness.occuredOn = occuredOn
                            cutiness.type = "Cutiness"
                            
                            try? managedObjectContext.save()
                            
                            UINotificationFeedbackGenerator().notificationOccurred(.success)
                            
                            isShowing.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Save")
                        }
                        .padding(4)
                        .padding(.horizontal, 3)
                        .foregroundColor(.white)
                        .background(description != "" ? Color.accentColor : Color.gray)
                        .cornerRadius(10)
                    }

                }
            }
            .navigationTitle("Brownie Points")
        }
    }

}

struct AddCutinessView_Previews: PreviewProvider {
    static var previews: some View {
        AddCutinessView(isShowing: .constant(true))
    }
}
