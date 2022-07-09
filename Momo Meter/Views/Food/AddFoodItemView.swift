//
//  AddFoodItemView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 09/07/22.
//

import SwiftUI

struct AddFoodItemView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var foodItems: FetchedResults<FoodItem>
    
    @Binding var isShowing: Bool
    
    @State private var name: String = ""
    @State private var sammyScore: Double = 0.5
    @State private var momoScore: Double = 0.5
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Dish Name", text: $name)
                
                Section("Liking") {
                    HStack {
                        Text("Sammy    ")
                        Slider(value: $sammyScore, in: 0...1)
                    }
                    HStack {
                        Text("Momo      ")
                        Slider(value: $momoScore, in: 0...1)
                    }
                }
            }
            .navigationTitle(Text("Add Dish"))
            .navigationBarItems(trailing: Button(action: {
                if name != "" {
                    var item = FoodItem(context: managedObjectContext)
                    item.name = name
                    item.score = sammyScore - momoScore
                    
                    try? managedObjectContext.save()
                }
            }, label: {
                Image(systemName: "plus.square.fill.on.square.fill")
                    .foregroundColor(name != "" ? .accentColor : .gray)
            }))
        }
    }
}

struct AddFoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodItemView(isShowing: .constant(true))
    }
}
