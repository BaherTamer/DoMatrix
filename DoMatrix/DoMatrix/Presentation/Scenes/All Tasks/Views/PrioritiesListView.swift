//
//  PrioritiesListView.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import SwiftUI

struct PrioritiesListView: View {
    
    @AppStorage(PreferenceKeys.showCompletedTasks) private var showCompletedTasks: Bool = false
    @AppStorage(PreferenceKeys.selectedPriority) private var selectedPriority: Int = 0
    
    @State private var isShowingTaskDetailsView: Bool = false
    
    var body: some View {
        List {
            ForEach(DMPriority.allCases, id: \.self) { priority in
                if selectedPriority == 0 || priority.rawValue == selectedPriority {
                    PriorityHeader(priority: priority)
                    TasksListView(priority: priority)
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    showCompletedTasksButton
                    Divider()
                    priorityFilterMenu
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
    
    private var priorityFilterMenu: some View {
        Menu {
            Picker("Priority", selection: $selectedPriority) {
                Text("All").tag(0)
                ForEach(DMPriority.allCases, id: \.self) { priority in
                    Text(priority.title).tag(priority.rawValue)
                }
            }
        } label: {
            Label("Priority", systemImage: SFSymbols.priorityFilter)
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
