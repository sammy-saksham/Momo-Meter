//
//  FoodView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 09/07/22.
//

import SwiftUI

struct FoodView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var foodItems: FetchedResults<FoodItem>
    @FetchRequest(sortDescriptors: []) var foodLogs: FetchedResults<FoodLog>
    
    @State private var score: Double = 0.7
    
    @State private var showAddSheet: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    HStack  {
                        Spacer()
                        Button {
                            showAddSheet.toggle()
                        } label: {
                            Image(systemName: "plus.square.fill.on.square.fill")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }

                    Text("Dish Name")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button {
                            //Kha liya function
                        } label: {
                            Image(systemName: "hand.thumbsup.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Spacer()
                        Button {
                            //Kha liya function
                        } label: {
                            Image(systemName: "hand.thumbsdown.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            .frame(width: UIScreen.main.bounds.width - 20, height: 300, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.teal]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            
            SliderView(score: $score)
                .cornerRadius(8)
                .transition(.scale)
                .animation(.easeInOut)
                .padding()

            List {
                ForEach((1...10).reversed(), id: \.self) {
                    Text("\($0)…")
                }
            }
            .listStyle(.inset)
        }
        .sheet(isPresented: $showAddSheet) {
            AddFoodItemView(isShowing: $showAddSheet)
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
