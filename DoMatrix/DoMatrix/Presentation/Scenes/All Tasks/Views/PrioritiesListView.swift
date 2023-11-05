//
//  PrioritiesListView.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import SwiftUI

struct PrioritiesListView: View {
    
    @AppStorage(PreferenceKeys.showCompletedTasks) private var showCompletedTasks: Bool = false
    
    @State private var isShowingTaskDetailsView: Bool = false
    
    var body: some View {
        List {
            ForEach(DMPriority.allCases, id: \.self) { priority in
                PriorityHeader(priority: priority)
                TasksListView(priority: priority)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    showCompletedTasksButton
                } label: {
                    Image(systemName: SFSymbols.menu)
                }
            }
            
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
extension PrioritiesListView {
    private var showCompletedTasksButton: some View {
        Button {
            withAnimation {
                showCompletedTasks.toggle()
            }
        } label: {
            Label(
                showCompletedTasks ? "Hide Completed" : "Show Completed",
                systemImage: showCompletedTasks ? SFSymbols.hideCompletedTasks : SFSymbols.showCompletedTasks
            )
        }
    }
    
    private var newTaskButtonLabel: some View {
        HStack {
            Image(systemName: SFSymbols.addNewTask)
            Text("New Task")
        }
        .font(.headline)
    }
}

#Preview {
    PrioritiesListView()
}
