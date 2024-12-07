//
//  HabitView.swift
//  HWS Habit Tracker
//
//  Created by Constantin Lisnic on 07/12/2024.
//

import SwiftUI

struct HabitView: View {
    var habitTracker: HabitTracker

    var habit: HabitItem

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text(habit.description)

                Spacer()

                Text(String(habit.count))
                    .font(.largeTitle.bold())

                Spacer()

                Button("Add practice") {
                    addPractice()
                }

                Spacer()
            }
            .navigationTitle(habit.title)
        }
    }

    func addPractice() {
        var newHabitItem = habit
        newHabitItem.count += 1

        let habitIndex = habitTracker.habitList.firstIndex(
            of: habit)

        if let habitIndex {
            habitTracker.habitList[habitIndex].count += 1
        }
    }

}

#Preview {
    let sampleHabit = HabitItem(
        title: "Chess",
        description: "Learn to play chess",
        count: 2
    )

    let sampleHabitTracker = HabitTracker()

    HabitView(habitTracker: sampleHabitTracker, habit: sampleHabit)
}
