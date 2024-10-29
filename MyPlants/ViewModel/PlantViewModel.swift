//
//  PlantViewModel.swift
//  MyPlants
//
//  Created by Ghada Alshabanat on 26/04/1446 AH.
//

import SwiftUI
import Combine

class PlantViewModel: ObservableObject {
    @Published var name: String = "" // Stores the plant name
    @Published var location: String = "Bedroom" // Stores the location
    @Published var sunlight: String = "Full Sun" // Stores the sunlight level
    @Published var WateringDays: String = "Every day" // Stores the watering frequency
    @Published var Water: String = "20-50 ml" // Stores the amount of water
    @Published var reminders: [Reminder] = [] // List of reminders
    @Published var showAddReminder: Bool = false // Controls visibility of the add reminder sheet
    @Published var isActive = true // Controls splash screen activity
    @Published var isChecked = false // Indicates if a reminder is checked

    let RoomOptions = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"] // Room options
    let lightOptions: [(String, String)] = [("Full Sun", "sun.max"), ("Partial Sun", "sunrise"), ("Low Light", "moon")] // Light options with icons
    let WateringDaysOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"] // Watering frequency options
    let WaterOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"] // Water amount options

    // Function to add a new reminder
    func addReminder() {
        let newReminder = Reminder(name: name, location: location, sunlight: sunlight, WateringDays: WateringDays, Water: Water)
        reminders.append(newReminder) // Adds the new reminder to the list
    }

    // Function to delete a reminder from the list
    func deleteReminder(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets) // Removes the reminder at the specified index
    }

    // Function to reset fields to default values
    func resetFields() {
        name = "" // Resets the plant name
        location = "Bedroom" // Resets the location
        sunlight = "Full Sun" // Resets the sunlight level
        WateringDays = "Every day" // Resets the watering frequency
        Water = "20-50 ml" // Resets the water amount
    }
}

struct Reminder: Identifiable {
    let id = UUID() // Unique identifier for each reminder
    var name: String // Plant name
    var location: String // Location of the plant
    var sunlight: String // Sunlight level
    var WateringDays: String // Watering frequency
    var Water: String // Amount of water
    var isChecked: Bool = false // Indicates if the reminder is marked as completed
}

