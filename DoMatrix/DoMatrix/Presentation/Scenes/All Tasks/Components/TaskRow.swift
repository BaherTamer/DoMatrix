//
//  TaskRow.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import OSLog
import SwiftUI

struct TaskRow: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var isShowingConfirmationDialog: Bool = false
    
    var task: DMTask
    
    var body: some View {
        HStack {
            Button {
                checkBoxButtonPressed()
            } label: {
                Image(systemName: task.isCompleted ? SFSymbols.taskIsCompleted : SFSymbols.taskIsNotCompleted)
                    .font(.headline)
                    .foregroundStyle(task.priority.color)
                    .imageScale(.large)
            }
            
            Text(task.title)
                .foregroundStyle(task.isCompleted ? .secondary : .primary)
        }
        .swipeActions(allowsFullSwipe: true) {
            Button("Delete", systemImage: SFSymbols.delete) {
                deleteActionSwiped()
            }
            .tint(.red) // Confirmation Dialog doesn't work with destructive button
        }
        .confirmationDialog("Are you sure you want to delete this task?", isPresented: $isShowingConfirmationDialog) {
            Button("Delete", role: .destructive) {
                deleteButtonPressed()
            }
            
            Button("Cancel", role: .cancel) {
                cancelButtonPressed()
            }
        }
    }
}

// MARK: - Functions
extension TaskRow {
    
    private func checkBoxButtonPressed() {
        withAnimation {
            task.isCompleted.toggle()
            saveContext()
        }
    }
    
    private func deleteActionSwiped() {
        withAnimation {
            self.isShowingConfirmationDialog = true
        }
    }
    
    private func deleteButtonPressed() {
        withAnimation {
            modelContext.delete(task)
            saveContext()
        }
    }
    
    private func cancelButtonPressed() {
        withAnimation {
            self.isShowingConfirmationDialog = false
        }
    }
    
    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            Logger.saveContext.error("Failed to save the task, \(error).")
        }
    }
    
}
