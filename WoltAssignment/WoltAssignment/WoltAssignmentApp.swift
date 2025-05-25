//
//  WoltAssignmentApp.swift
//  WoltAssignment
//
//  Created by Miguel Bou Sleiman on 5/22/25.
//

import SwiftUI
import NetworkManager
import VenuesList

@main
struct WoltAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            VenuesListFactory.makeVenuesList()
        }
    }
}
