//
//  BarView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 06/07/22.
//

import SwiftUI

struct BarView: View {
  var datum: Double
  var colors: [Color]

  var gradient: LinearGradient {
    LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
  }

  var body: some View {
    RoundedRectangle(cornerRadius: 5)
      .fill(gradient)
      .opacity(datum == 0.0 ? 0.0 : 1.0)
  }
}

//struct BarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BarView()
//    }
//}
