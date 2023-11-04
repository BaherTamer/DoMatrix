//
//  PriorityHeader.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import SwiftUI

struct PriorityHeader: View {
    let priority: DMPriority
    
    var body: some View {
        Text(priority.title)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(priority.color)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
    }
}

#Preview {
    PriorityHeader(priority: .schedule)
}
