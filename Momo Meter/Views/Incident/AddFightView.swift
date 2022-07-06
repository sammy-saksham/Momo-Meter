//
//  AddFightView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 05/07/22.
//

import SwiftUI

struct AddFightView: View {
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
                            let fight = Incident(context: managedObjectContext)
                            
                            fight.by = by
                            fight.desc = description
                            fight.occuredOn = occuredOn
                            fight.type = "Fight"
                            
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
            .navigationTitle("Add Fight")
        }
    }
}

struct AddFightView_Previews: PreviewProvider {
    static var previews: some View {
        AddFightView(isShowing: .constant(true))
    }
}
