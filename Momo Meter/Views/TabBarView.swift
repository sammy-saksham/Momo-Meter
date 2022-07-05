//
//  TabBarView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 05/07/22.
//

import SwiftUI

struct TabBarView: View {
    @State private var screenShowing: Bool = false
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.accentColor)], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white ], for: .selected)
    }
    
    var body: some View {
        VStack {
            
            if !screenShowing {
                IncidentView()
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                    .animation(.easeInOut)
            } else {
                Text("Food")
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                    .animation(.easeInOut)
            }
            
            Spacer()
            
            Picker("Select Screen", selection: $screenShowing) {
                Text("Incidents")
                    .tag(false)
                Text("Food")
                    .tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 350, height: 70, alignment: .center)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
