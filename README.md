
# 🌿 Plants - Plant Care Reminder App

Plants is a SwiftUI-based iOS application designed to help users manage and care for their plants effectively. It allows users to set reminders for watering, track plant locations, and monitor sunlight requirements, ensuring that plants receive the attention they need to thrive.

## Features

- **Add Plant Reminders:** Users can add reminders for individual plants, specifying watering frequency, location, and sunlight requirements.
- **Edit or Delete Reminders:** Users can easily modify or delete existing reminders.
- **Track Multiple Plants:** Manage multiple plants in one place and receive daily reminders.
- **Splash Screen:** The app displays a splash screen when launched, creating a welcoming experience.
- **User-Friendly Interface:** Simple and intuitive interface built with SwiftUI.
- **Dark Mode Support:** Supports dark mode for a better user experience in low-light conditions.

## Installation

1. **Clone the repository:**

3. **Open the project in Xcode:**
   
4. **Build and run the app:** 
   

## Usage

1. **Add a New Plant:**
   - Tap the "Add Plant" button to create a new reminder.
   - Enter plant details such as name, location, sunlight, watering days, and water amount.
   
2. **Manage Reminders:**
   - View all reminders on the "Today's Reminders" screen.
   - Mark a reminder as completed or swipe left to delete it.
   - Edit an existing reminder by tapping on it and modifying the details.
   
3. **Set New Reminders:**
   - Once all reminders are completed, the app will prompt users to set new reminders.

## Project Structure

- **`HomePage.swift`**: Contains the main interface, displaying the splash screen and allowing users to navigate to the reminders list or set new reminders.
- **`Set_Reminder.swift`**: Provides a form interface to add new plant reminders, including plant name, location, and care details.
- **`TodatReminder.swift`**: Displays today's reminders, allowing users to mark them as completed or delete them.
- **`RemindersCompleted.swift`**: Shows a message when all reminders are completed, with an option to set new reminders.
- **`DeleteEditPlant.swift`**: Allows users to edit plant details or delete reminders.
- **`PlantViewModel.swift`**: Manages plant-related data, including the list of reminders, adding new reminders, and resetting fields.

