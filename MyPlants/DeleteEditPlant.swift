//
//  DeleteEditPlant.swift
//  MyPlants
//
//  Created by Ghada Alshabanat on 26/04/1446 AH.
//

import SwiftUI

struct DeleteEditPlant: View {
    @Binding var reminder: Reminder // Binding variable to edit the reminder
    @ObservedObject var plantViewModel: PlantViewModel // ObservedObject to manage plant data
    @Environment(\.dismiss) var dismiss // Environment variable to dismiss the view

    var body: some View {
        NavigationStack {
            Form {
                // Section to edit plant name
                Section {
                    HStack {
                        Text("Plant Name") // Label for plant name
                        TextField("Pothos", text: $reminder.name) // Text field to enter/edit plant name
                    }
                }
                
                // Section to edit location and light
                Section {
                    HStack {
                        Image(systemName: "location") // Location icon
                        Picker("Room", selection: $reminder.location) {
                            ForEach(plantViewModel.RoomOptions, id: \.self) { room in
                                Text(room) // Display room options
                            }
                        }
                    }

                    HStack {
                        Image(systemName: "sun.max") // Sunlight icon
                        Picker("Light", selection: $reminder.sunlight) {
                            ForEach(plantViewModel.lightOptions.map { $0.0 }, id: \.self) { option in
                                Text(option) // Display light options
                            }
                        }
                    }
                }
                
                // Section to edit watering days and water amount
                Section {
                    HStack {
                        Image(systemName: "drop") // Water drop icon
                        Picker("Watering days", selection: $reminder.WateringDays) {
                            ForEach(plantViewModel.WateringDaysOptions, id: \.self) { day in
                                Text(day) // Display watering days options
                            }
                        }
                    }

                    HStack {
                        Image(systemName: "drop") // Water drop icon
                        Picker("Water", selection: $reminder.Water) {
                            ForEach(plantViewModel.WaterOptions, id: \.self) { water in
                                Text(water) // Display water amount options
                            }
                        }
                    }
                }

                // Section to delete the reminder
                Section {
                    Button(action: {
                        // Remove the reminder from the list
                        if let index = plantViewModel.reminders.firstIndex(where: { $0.id == reminder.id }) {
                            plantViewModel.reminders.remove(at: index) // Delete the reminder
                        }
                        dismiss() // Dismiss the view after deletion
                    }) {
                        Text("Delete Reminder") // Button label
                            .font(.headline)
                            .foregroundColor(Color("red")) // Set text color to red
                            .frame(width:396 ,height:44 ) // Set button width and height
                            .cornerRadius(8) // Rounded corners
                    }
                }
            }
            .navigationTitle("Set Reminder") // Set the navigation title
            .navigationBarTitleDisplayMode(.inline) // Inline title display mode
            .toolbar {
                ToolbarItem(placement: .topBarLeading) { // Cancel button on the left
                    Button("Cancel") {
                        dismiss() // Dismiss the view
                    }
                    .foregroundColor(Color("Green")) // Set text color to green
                }

                ToolbarItem(placement: .topBarTrailing) { // Save button on the right
                    Button("Save") {
                        dismiss() // Dismiss the view
                    }
                    .foregroundColor(Color("Green")) // Set text color to green
                }
            }
        }
        .background(Color("Background")) // Set the background color
    }
}
