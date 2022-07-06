//
//  IncidentItemView.swift
//  Momo Meter
//
//  Created by Saksham Jain on 06/07/22.
//

import SwiftUI

struct IncidentItemView: View {
    var incident: Incident
    
    var body: some View {
        HStack {
            Image("\(incident.type ?? "Fight")Icon")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(incident.desc ?? "Unknown")
                    .fontWeight(.semibold)
                Text(incident.occuredOn ?? Date.distantPast, style: .date)
                    .font(.caption)
            }
            
            Spacer()
            
            VStack {
                Text(incident.by ?? "Unknown").fontWeight(.medium)
                Text("did it!")
            }
            .font(.caption)
            .padding(.trailing)
        }
        .padding(5)
        .background(incident.type == "Fight" ? Color.pink.opacity(0.4) : Color.green.opacity(0.4))
    }
}

//struct IncidentItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        IncidentItemView()
//            .previewLayout(.sizeThatFits)
//    }
//}
