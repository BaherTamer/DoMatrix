//
//  PrioritiesListView.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import SwiftUI

struct PrioritiesListView: View {
    var body: some View {
        List {
            ForEach(DMPriority.allCases, id: \.self) { priority in
                PriorityHeader(priority: priority)
                TasksListView(priority: priority)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    PrioritiesListView()
}
