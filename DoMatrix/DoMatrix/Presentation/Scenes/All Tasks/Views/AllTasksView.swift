//
//  AllTasksView.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import SwiftData
import SwiftUI

struct AllTasksView: View {
    
    @Query private var tasks: [DMTask]
    @State private var isShowingTaskDetailsView: Bool = false
    
    var body: some View {
        Group {
            if !tasks.isEmpty {
                PrioritiesListView()
            } else {
                ContentUnavailableView {
                    Label("No Tasks", systemImage: SFSymbols.noTasks)
                } description: {
                    Text("It all starts with a single task.")
                } actions: {
                    Button("Add Task") {
                        isShowingTaskDetailsView.toggle()
                    }
                }
            }
        }
        .navigationTitle("All Tasks")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isShowingTaskDetailsView) {
            TaskDetailsView()
        }
    }
}

#Preview {
    AllTasksView()
}
