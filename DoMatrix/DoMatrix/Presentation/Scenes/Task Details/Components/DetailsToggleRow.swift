//
//  DetailsToggleRow.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import SwiftUI

struct DetailsToggleRow: View {
    @Binding var isOn: Bool
    
    let title: String
    let systemImage: String
    let imageColor: Color
    
    var body: some View {
        Toggle(isOn: $isOn, label: {
            HStack {
                Image(systemName: systemImage)
                    .font(.title)
                    .foregroundStyle(imageColor)
                
                Text(title)
            }
        })
    }
}

#Preview {
    DetailsToggleRow(isOn: .constant(true), title: "Urgent", systemImage: SFSymbols.toggleUrgent, imageColor: .pink)
}
