//
//  AddView.swift
//  HWS Habit Tracker
//
//  Created by Constantin Lisnic on 07/12/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var habitTitle = ""
    @State private var habitDescription = ""

    var habitTracker: HabitTracker

    var body: some View {
        NavigationStack {

            Form {
                Section("Habit name") {
                    TextField("Please enter a habit", text: $habitTitle)
                }

                Section("Habit description") {
                    TextField(
                        "Please enter a habit description",
                        text: $habitDescription)
                }
            }
            .navigationTitle("Add Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newHabit = HabitItem(
                            title: habitTitle, description: habitDescription)
                        habitTracker.habitList.insert(newHabit, at: 0)

                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    let sampleHabits = HabitTracker()

    if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
        if let decodedItems = try? JSONDecoder().decode(
            [HabitItem].self, from: savedHabits)
        {
            sampleHabits.habitList = decodedItems
        }
    }

    return AddView(habitTracker: sampleHabits)
}
