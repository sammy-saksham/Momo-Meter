//
//  ChartView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 06/07/22.
//

import SwiftUI

struct ChartView: View {
    var DataPoints: [Double]
    var category: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(category == "Fight" ? .pink.opacity(0.2) : .green.opacity(0.2))
                .frame(width: UIScreen.main.bounds.width - 20, height: 250, alignment: .center)
            
            BarChartView(data: DataPoints, colors: category == "Fight" ? [Color.accentColor, Color.orange] : [Color.green, Color.teal])
                .padding(.bottom, 35)
                .padding(.top, 30)
                .padding(.horizontal)
        }
    }
}

//struct ChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartView()
//            .previewLayout(.sizeThatFits)
//    }
//}
