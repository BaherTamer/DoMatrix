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
                ContentUnavailableView(
                    "No Tasks",
                    systemImage: SFSymbols.noTasks,
                    description: Text("It all starts with a single task. Add yours and make it count.")
                )
            }
        }
        .navigationTitle("All Tasks")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    isShowingTaskDetailsView.toggle()
                } label: {
                    newTaskButtonLabel
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $isShowingTaskDetailsView) {
            TaskDetailsView()
        }
    }
}

// MARK: - Variables
extension AllTasksView {
    private var newTaskButtonLabel: some View {
        HStack {
            Image(systemName: SFSymbols.addNewTask)
            Text("New Task")
        }
        .font(.headline)
    }
}

#Preview {
    AllTasksView()
}
