//
//  MyPlantsApp.swift
//  MyPlants
//
//  Created by Ghada Alshabanat on 26/04/1446 AH.
//

import SwiftUI

@main
struct MyPlantsApp: App {
    var body: some Scene {
        WindowGroup {
            HomePage()
                .preferredColorScheme(.dark)
        }
    }
}
