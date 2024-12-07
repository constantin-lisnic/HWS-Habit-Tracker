//
//  ContentView.swift
//  HWS Habit Tracker
//
//  Created by Constantin Lisnic on 07/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var habitTracker = HabitTracker()
    @State private var isShowingAddView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(habitTracker.habitList) { habit in
                    NavigationLink {
                        HabitView(habitTracker: habitTracker, habit: habit)
                    } label: {
                        HStack {
                            Text(habit.title)
                            
                            Spacer()
                            
                            Text(String(habit.count))
                        }
                    }
                }
                .onDelete(perform: removeHabit)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add Habit") {
                    isShowingAddView.toggle()
                }
                .sheet(isPresented: $isShowingAddView) {
                    AddView(habitTracker: habitTracker)
                }
            }
        }
    }

    func removeHabit(at offsets: IndexSet) {
        habitTracker.habitList.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
