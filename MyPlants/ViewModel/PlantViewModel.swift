//
//  PlantViewModel.swift
//  MyPlants
//
//  Created by Ghada Alshabanat on 26/04/1446 AH.
//

import Foundation
import SwiftUI
import Combine

class PlantViewModel: ObservableObject {
    // Published variables to update the view automatically when changed
    @Published var name: String = ""
    @Published var location: String = "Bedroom"
    @Published var sunlight: String = "Full Sun"
    @Published var WateringDays: String = "Every day"
    @Published var Water: String = "20-50 ml"
   // @Published var reminders: [Reminder] = []
    @Published var showAddReminder: Bool = false
    @Published var isActive = true
    @Published var isChecked = false
    
    // Options for dropdown menus in the app
    let RoomOptions = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"] // خيارات الغرف
    let lightOptions: [(String, String)] = [("Full Sun", "sun.max"), ("Partial Sun", "sunrise"), ("Low Light", "moon")]
    let WateringDaysOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let WaterOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"] // خيارات كمية الماء

    // Function to add a new reminder
//    func addReminder() {
//        // إنشاء تذكير جديد
//        let newReminder = Reminder(name: name, location: location, sunlight: sunlight, WateringDays: WateringDays, Water: Water)
//        reminders.append(newReminder)
//        clearFields()
//    }
//    
    // Function to clear fields after adding a reminder
    func clearFields() {
        name = ""
        location = "Bedroom"
        sunlight = "Full Sun"
        WateringDays = "Every day"
        Water = "20-50 ml"
    }
}
