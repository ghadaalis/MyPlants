//
//  ContentView.swift
//  MyPlants
//
//  Created by Ghada Alshabanat on 26/04/1446 AH.
//

import SwiftUI

struct HomePage: View {
    @State var showSheet = false // Controls the visibility of the sheet
    let appName: String = "My Plants 🌱" // App title
    @StateObject var plantViewModel = PlantViewModel() // Manages plant data
    @State private var navigateToRemindersList = false // Controls navigation to the reminders list
    
    var body: some View {
        NavigationStack {
            Group {
                // Splash Screen
                if plantViewModel.isActive {
                    VStack {
                        Image("plantlog") // Display the app logo
                            .resizable()
                            .scaledToFit()
                            .frame(width: 164, height: 200)
                            .padding()
                            .onAppear {
                                // Show the splash screen for 10 seconds before transitioning
                                DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                                    withAnimation {
                                        plantViewModel.isActive = false // End the splash screen
                                    }
                                }
                            }
                        Text("Planto") // Display the app name
                            .bold()
                            .font(.system(size: 90)) // Adjust the font size as needed
                        Text("Plant Care reminders 🌿") // App description
                            .fontWeight(.regular)
                            .foregroundColor(Color("H3"))
                            .font(Font.custom("SF Pro", size: 16))
                            .multilineTextAlignment(.center)
                    }
                } else {
                    VStack { // Arrange elements vertically
                        Divider() // Adds a horizontal line for separation
                            .background(Color.gray)
                            .padding(.top, 15)
                        
                        Spacer()
                        
                        ZStack {
                            Image("backpic") // Background image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 219, height: 227)
                            Image("plantlog") // App logo
                                .resizable()
                                .scaledToFit()
                                .frame(width: 164, height: 200)
                        }
                        
                        Spacer()
                        
                        Text("Start your plant journey!") // Encouragement message
                            .fontWeight(.semibold)
                            .foregroundColor(Color("H2"))
                            .font(Font.custom("SF Pro", size: 25))
                            .multilineTextAlignment(.center)
                        
                        Text("Now all your plants will be in one place and we will help you take care of them :)🪴") // Description
                            .fontWeight(.regular)
                            .foregroundColor(Color("H3"))
                            .font(Font.custom("SF Pro", size: 16))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .padding()
                        
                        // Button to set plant reminders
                        Button(action: {
                            plantViewModel.showAddReminder.toggle() // Show the add reminder sheet
                        }) {
                            Text("Set Plant Reminder") // Button label
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(Color("H4"))
                                .frame(width: 280, height: 40)
                                .background(Color("Button"))
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $plantViewModel.showAddReminder, onDismiss: {
                            // Check if a new reminder was added
                            if !plantViewModel.reminders.isEmpty {
                                navigateToRemindersList = true // Navigate to the reminders list
                            }
                        }) {
                            Set_Reminder(plantViewModel: plantViewModel, showSheet: $plantViewModel.showAddReminder) // Add reminder view
                        }
                        
                        Spacer()
                        Spacer()
                    }
                    .navigationTitle("My Plants 🌱") // Sets the navigation title
                    
                    // Navigation to the reminders page
                    NavigationLink(destination: TodatReminder(plantViewModel: plantViewModel), isActive: $navigateToRemindersList) {
                        EmptyView() // Hidden link to the reminders page
                    }
                    .hidden()
                }
            }
        }
    }
}


#Preview {
    HomePage()
        .preferredColorScheme(.dark)
}
