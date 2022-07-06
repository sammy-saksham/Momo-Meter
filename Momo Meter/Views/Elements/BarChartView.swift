//
//  BarChartView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 06/07/22.
//

import SwiftUI

struct BarChartView: View {
  var data: [Double]
  var colors: [Color]

  var highestData: Double {
    let max = data.max() ?? 1.0
    if max == 0 { return 1.0 }
    return max
  }
    
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

  var body: some View {
    GeometryReader { geometry in
      HStack(alignment: .bottom, spacing: 4.0) {
        ForEach(data.indices, id: \.self) { index in
          let width = (geometry.size.width / CGFloat(data.count)) - 4.0
          let height = geometry.size.height * data[index] / highestData

            VStack {
                Text(data[index] != 0 ? String(Int(data[index])) : "")
                    .font(.caption2)
                    
                BarView(datum: data[index], colors: colors)
                    .frame(width: width, height: height, alignment: .bottom)
                
                Text(months[index])
                    .font(.caption2)
            }
        }
      }
    }
  }
}

//struct BarChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        BarChartView()
//    }
//}
