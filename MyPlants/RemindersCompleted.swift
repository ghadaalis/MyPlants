//
//  RemindersCompleted.swift
//  MyPlants
//
//  Created by Ghada Alshabanat on 26/04/1446 AH.
//

import SwiftUI

struct RemindersCompleted: View {
    @ObservedObject var plantViewModel: PlantViewModel // Manages plant data
    @State private var navigateToSetReminder = false // Controls navigation to the add reminder page

    var body: some View {
        NavigationStack {
            VStack { // Arranges elements vertically
                // Horizontal line for separation
                Divider()
                    .background(Color.gray) // Sets the line color
                    .padding(.top, 15)

                Spacer() // Adds flexible space
                
                // Image display
                ZStack {
                    Image("backImgComp") // Background image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 219, height: 227)
                    
                    Image("CompImg") // Foreground image from assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 164, height: 200)
                }
                
                Spacer() // Adds flexible space
                
                // First text
                Text("All Done! 🎉") // Completion message
                    .fontWeight(.semibold)
                    .foregroundColor(Color("H2")) // Sets text color
                    .font(Font.custom("SF Pro", size: 25)) // Custom font
                    .multilineTextAlignment(.center) // Centered text alignment
                    .padding(.top, -100) // Adjusts top padding
                
                // Second text
                Text("All Reminders Completed") // Informative message
                    .fontWeight(.regular)
                    .foregroundColor(Color("H3")) // Sets text color
                    .font(Font.custom("SF Pro", size: 16)) // Custom font
                    .multilineTextAlignment(.center) // Centered text alignment
                    .padding(.horizontal, 20) // Horizontal padding
                    .padding() // General padding
                    .padding(.top, -80) // Adjusts top padding
                
                Spacer() // Adds flexible space
            }
            .navigationTitle("My Plants 🌱") // Sets navigation title
            .navigationBarBackButtonHidden(true) // Hides the back button
            .overlay(
                HStack {
                    Spacer() // Adds flexible space
                    
                    // Navigation link to add a new reminder
                    NavigationLink(destination: Set_Reminder(plantViewModel: plantViewModel, showSheet: .constant(false)), isActive: $navigateToSetReminder) {
                        EmptyView() // Hidden link for navigation
                    }
                    
                    Button(action: {
                        navigateToSetReminder = true // Activates navigation to add a new reminder
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill") // Plus icon
                            Text("New Reminder") // Button label
                        }
                        .font(.headline) // Sets font size
                        .foregroundColor(Color("Green")) // Sets text color
                        .padding(12) // Adds padding
                        .background(Color.black.opacity(0.8)) // Sets background color with opacity
                        .cornerRadius(10) // Rounds the corners
                    }
                    .padding() // Adds padding around the button
                    .frame(maxWidth: .infinity, alignment: .leading) // Aligns button to the left
                },
                alignment: .bottomLeading // Positions the overlay at the bottom left
            )
        }
    }
}

#Preview {
    RemindersCompleted(plantViewModel: PlantViewModel())
        .preferredColorScheme(.dark)
}
