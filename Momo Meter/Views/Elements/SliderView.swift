//
//  SliderView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 09/07/22.
//

import SwiftUI

struct SliderView: View {
    @Binding var score: Double
    
    var body: some View {
        HStack(spacing: 4) {
            Text("Sammy")
                .padding(.leading, 5)
                .frame(width: UIScreen.main.bounds.width * score - 15, height: 30, alignment: .leading)
                .background(Color.pink)
                .foregroundColor(.white)
            
            Text("Momo")
                .padding(.trailing, 5)
                .frame(width: UIScreen.main.bounds.width * (1 - score) - 15, height: 30, alignment: .trailing)
                .background(Color.orange)
                .foregroundColor(.white)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    @State static var value: Double = 0.7
    
    static var previews: some View {
        SliderView(score: $value)
            .previewLayout(.sizeThatFits)
    }
}
