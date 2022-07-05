//
//  TabBarView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 05/07/22.
//

import SwiftUI

struct TabBarView: View {
    @State private var screenShowing: Int = 0
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.accentColor)], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white ], for: .selected)
    }
    
    var body: some View {
        VStack {
            IncidentView()
            
            Picker("Select Screen", selection: $screenShowing) {
                Text("Incidents")
                    .tag(0)
                Text("Food")
                    .tag(1)
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
