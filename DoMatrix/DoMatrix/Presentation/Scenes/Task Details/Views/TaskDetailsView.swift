//
//  TaskDetailsView.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import OSLog
import SwiftUI

struct TaskDetailsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var task: DMTask = .init()
    
    var body: some View {
        NavigationView {
            Form {
                taskInfoSection
                taskPrioritySection
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        cancelButtonPressed()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        doneButtonPressed()
                    }
                }
            }
        }
    }
}

// MARK: - Variables
extension TaskDetailsView {
    // Task info section
    private var taskInfoSection: some View {
        Section {
            TextField("Title", text: $task.title)
                .textInputAutocapitalization(.never)
        }
    }
    
    // Task priority section
    private var taskPrioritySection: some View {
        Section {
            
            DetailsToggleRow(isOn: $task.isUrgent, title: "Urgent", systemImage: SFSymbols.toggleUrgent, imageColor: .pink)
            
            DetailsToggleRow(isOn: $task.isImportant, title: "Important", systemImage: SFSymbols.toggleImportant, imageColor: .orange)
            
        } footer: {
            Text("Task priority: \(priorityFooter)")
        }
    }
    
    private var priorityFooter: Text {
        Text(task.priority.title)
            .fontWeight(.semibold)
            .foregroundStyle(task.priority.color)
    }
}

// MARK: - Functions
extension TaskDetailsView {
    private func cancelButtonPressed() {
        dismiss()
    }
    
    private func doneButtonPressed() {
        if task.title.isEmpty {
            task.title = "New Task"
        }
        
        withAnimation {
            modelContext.insert(task)
            saveContext()
        }
        
        dismiss()
    }
    
    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            Logger.saveContext.error("Failed to save the task, \(error).")
        }
    }
}
