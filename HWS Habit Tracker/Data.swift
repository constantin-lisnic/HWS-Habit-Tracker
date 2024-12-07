//
//  Data.swift
//  HWS Habit Tracker
//
//  Created by Constantin Lisnic on 07/12/2024.
//

import Foundation
import Observation

struct HabitItem: Identifiable, Codable, Equatable {
    var title: String = ""
    var description: String = ""
    var count: Int = 0
    var id = UUID()
}

@Observable
class HabitTracker {
    var habitList = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habitList) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }

    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode(
                [HabitItem].self, from: savedHabits)
            {
                habitList = decodedItems

                return
            }
        }

        habitList = []
    }
}
