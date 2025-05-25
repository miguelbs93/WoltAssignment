# WoltAssignment

This project is an iOS app demonstrating an implementation of a feature for discovering and favoriting nearby venues. 

## Features

- Fetches venues based on a rotating set of predefined locations
- Displays a scrollable list of venues with support for:
  - Loading indicator
  - Animated transitions between location changes
  - Favorites functionality with persistence (UserDefaults - since im only storing the venue's id)
  

## Technologies Used

- Swift
- SwiftUI
- MVVM Architecture
- Async/Await for network calls
- Unit Testing with XCTest
- SPM for modularization
