OqtepaLavash is a modern, responsive iOS mobility and food-ordering application built with SwiftUI and MapKit. Designed to help users effortlessly find nearby restaurant branches, browse interactive menus, and streamline the ordering process.
The application is built entirely with native iOS technologies following modern industry standards, including MVVM architecture and Swift Concurrency.
✨ Key Features
📍 Interactive Maps & Geolocation: Integrated MapKit and CoreLocation to detect user coordinates, showcase nearby branch locations with custom pins, and calculate distances.
🍔 Dynamic Menu & Catalog: Categorized food menu with detailed item cards, custom options, and dynamic cart integration.
🔍 Branch Finder & Filtering: Quick search and filtering for nearby branches based on operational status and proximity.
🛒 Cart & Order Management: Reactive shopping cart interface, instant total calculations, and smooth checkout flow.
🎨 Modern UI/UX: Clean, intuitive UI system with custom SwiftUI components, fluid animations, and dark/light mode optimization.
🛠 Tech Stack & Frameworks
Language: Swift 5+
UI Framework: SwiftUI
Maps & Location: MapKit, CoreLocation
Architecture: MVVM (Model-View-ViewModel)
Concurrency: Swift Concurrency (async/await, @MainActor)
State Management: Combine / @Observable
📐 Architecture & Structure
The codebase adheres to MVVM and Clean Architecture principles to ensure code modularity, readability, and scalability:
Plaintext
OqtepaLavash/
├── App/            # App entry point & lifecycle configuration
├── Models/         # Data structures (Product, Branch, Location, Order)
├── Views/          # SwiftUI views (Home, Map, Menu, Cart, BranchDetails)
├── ViewModels/     # State management & presentation logic
├── Services/       # Location services & API integration handlers
└── Resources/      # Asset catalogs, color palettes, and local data
