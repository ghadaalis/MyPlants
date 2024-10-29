//
//  TodatReminder.swift
//  MyPlants
//
//  Created by Ghada Alshabanat on 26/04/1446 AH.
//

import SwiftUI

struct TodatReminder: View {
    @ObservedObject var plantViewModel: PlantViewModel // Manages plant data
    @State private var selectedReminder: Reminder? // Tracks the selected reminder
    @State private var navigateToCompleteView = false // Controls navigation to "RemindersCompleted"

    var body: some View {
        NavigationStack {
            VStack {
                Divider() // Adds a horizontal line for separation
                    .background(Color.gray)
                    .padding(.top, 15)
                
                HStack {
                    Text("Today") // Displays "Today" label
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                }
                
                List {
                    // Sorts reminders, with completed reminders at the bottom
                    ForEach(plantViewModel.reminders.sorted(by: { !$0.isChecked && $1.isChecked }), id: \.id) { reminder in
                        HStack {
                            // Button to mark reminder as complete or incomplete
                            Button(action: {
                                if let index = plantViewModel.reminders.firstIndex(where: { $0.id == reminder.id }) {
                                    plantViewModel.reminders[index].isChecked.toggle() // Toggles completion status
                                    checkAllCompleted() // Checks if all reminders are completed
                                }
                            }) {
                                Image(systemName: reminder.isChecked ? "checkmark.circle.fill" : "circle") // Icon for completion
                                    .foregroundColor(reminder.isChecked ? .green : .gray) // Changes color based on status
                                    .font(.system(size: 24))
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "location") // Location icon
                                    Text("in \(reminder.location)") // Displays location
                                }
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                
                                Text(reminder.name) // Displays reminder name
                                    .font(.headline)
                                    .padding(2)
                                
                                HStack {
                                    HStack {
                                        Image(systemName: "sun.max") // Sunlight icon
                                        Text("\(reminder.sunlight)") // Displays sunlight info
                                    }
                                    .font(.footnote)
                                    .foregroundStyle(Color("H2"))
                                    .padding(4)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    
                                    HStack {
                                        Image(systemName: "drop") // Water icon
                                        Text("\(reminder.Water)") // Displays water info
                                    }
                                    .font(.footnote)
                                    .foregroundStyle(Color("lightBlue"))
                                    .padding(4)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                }
                            }
                            
                            Spacer() // Adds flexible space
                        }
                        .padding(.vertical, 8)
                        .opacity(reminder.isChecked ? 0.5 : 1.0) // Makes completed reminders appear lighter
                        .onTapGesture {
                            selectedReminder = reminder // Sets the selected reminder for editing
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                if let index = plantViewModel.reminders.firstIndex(where: { $0.id == reminder.id }) {
                                    plantViewModel.reminders.remove(at: index) // Deletes the reminder
                                }
                            } label: {
                                Label("Delete", systemImage: "trash") // Delete button with icon
                            }
                            .tint(.red) // Sets button color to red
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.black) // Sets background color
                .navigationTitle("My Plants 🌱") // Sets navigation title
                .navigationBarBackButtonHidden(true) // Hides the back button
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {
                            plantViewModel.showAddReminder.toggle() // Shows the add reminder sheet
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill") // Add icon
                                Text("New Reminder") // Button label
                            }
                            .font(.headline)
                            .foregroundColor(Color("Green")) // Sets button color
                            .padding(12)
                            .background(Color.black.opacity(0.8)) // Sets background opacity
                            .cornerRadius(10)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading) // Aligns button to the left
                    },
                    alignment: .bottomLeading
                )
                .sheet(item: $selectedReminder) { reminder in
                    // Opens Delete/Edit Reminder view for selected reminder
                    DeleteEditPlant(reminder: $plantViewModel.reminders[plantViewModel.reminders.firstIndex(where: { $0.id == reminder.id })!], plantViewModel: plantViewModel)
                }

                // Navigation link to "RemindersCompleted" when all reminders are completed
                NavigationLink(destination: RemindersCompleted(plantViewModel: plantViewModel), isActive: $navigateToCompleteView) {
                    EmptyView() // Hidden link for navigation
                }
            }
        }
    }
    
    // Checks if all reminders are completed
    private func checkAllCompleted() {
        if plantViewModel.reminders.allSatisfy({ $0.isChecked }) {
            navigateToCompleteView = true // Enables navigation to "RemindersCompleted"
        }
    }
}


#Preview {
    TodatReminder(plantViewModel: PlantViewModel())
        .preferredColorScheme(.dark)
}


