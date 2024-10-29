//
//  SwiftUIView.swift
//  MyPlants
//
//  Created by Ghada Alshabanat on 26/04/1446 AH.
//

import SwiftUI

struct Set_Reminder: View {
    @Environment(\.dismiss) var dismiss // Environment variable to dismiss the view
    @ObservedObject var plantViewModel: PlantViewModel // ObservedObject to manage plant data
    @Binding var showSheet: Bool // Controls the visibility of the sheet
    @State private var navigateToRemindersList = false // Controls navigation to the reminders list

    var body: some View {
        NavigationStack {
            Form {
                // Section 1: Plant Name
                Section {
                    HStack {
                        Text("Plant Name") // Label for plant name
                        TextField("Pothos", text: $plantViewModel.name) // Text field for entering plant name
                    }
                }

                // Section 2: Room and Light
                Section {
                    HStack {
                        Image(systemName: "location") // Location icon
                        Picker("Room", selection: $plantViewModel.location) {
                            ForEach(plantViewModel.RoomOptions, id: \.self) { room in
                                Text(room) // Displays available room options
                            }
                        }
                    }

                    HStack {
                        Image(systemName: "sun.max") // Sunlight icon
                        Picker("Light", selection: $plantViewModel.sunlight) {
                            ForEach(plantViewModel.lightOptions, id: \.0) { option in
                                HStack {
                                    Image(systemName: option.1) // SF Symbols icon
                                    Text(option.0) // Corresponding text
                                }
                                .tag(option.0) // Sets the tag for the selected option
                            }
                        }
                    }
                }

                // Section 3: Watering Days and Amount
                Section {
                    HStack {
                        Image(systemName: "drop") // Water drop icon
                        Picker("Watering Days", selection: $plantViewModel.WateringDays) {
                            ForEach(plantViewModel.WateringDaysOptions, id: \.self) { day in
                                Text(day) // Displays watering day options
                            }
                        }
                    }

                    HStack {
                        Image(systemName: "drop") // Water drop icon
                        Picker("Water", selection: $plantViewModel.Water) {
                            ForEach(plantViewModel.WaterOptions, id: \.self) { water in
                                Text(water) // Displays water amount options
                            }
                        }
                    }
                }
            }
            .navigationTitle("Set Reminder") // Sets the navigation title
            .navigationBarTitleDisplayMode(.inline) // Displays the title in the toolbar
            .navigationBarBackButtonHidden(true) // Hides the back button
            .toolbar {
                ToolbarItem(placement: .topBarLeading) { // Cancel button on the left
                    Button("Cancel") {
                        plantViewModel.resetFields() // Resets the fields
                        showSheet = false // Closes the sheet
                    }
                    .foregroundColor(Color("Green")) // Sets the button color
                }

                ToolbarItem(placement: .topBarTrailing) { // Save button on the right
                    Button("Save") {
                        plantViewModel.addReminder() // Adds the reminder
                        plantViewModel.resetFields() // Resets the fields
                        showSheet = false // Closes the sheet
                        navigateToRemindersList = true // Enables navigation
                    }
                    .foregroundColor(Color("Green")) // Sets the button color
                }
            }

            // Navigation to the reminders page when saved
            NavigationLink(destination: TodatReminder(plantViewModel: plantViewModel), isActive: $navigateToRemindersList) {
                EmptyView() // Hidden link for navigation
            }
            .hidden() // Makes the link invisible
        }
    }
}

#Preview {
    Set_Reminder(plantViewModel: PlantViewModel(), showSheet: .constant(false))
        .preferredColorScheme(.dark)
}

