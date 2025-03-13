# Diyosinfotech Check-In App

A Flutter application for capturing and storing check-in images with location and timestamp information.

## Features

- 📸 Camera integration for capturing check-in photos
- 📍 GPS location tracking with address display
- ⏰ Real-time date and time display
- 💾 Local storage for saving check-in history
- 📱 Responsive grid view of captured images
- 🎨 Modern Material Design 3 UI
- 🔒 Permission handling for camera and location services

## Technologies Used

### Core Framework
- Flutter SDK (3.29.0)
- Dart

### Dependencies
- `camera: ^0.10.5+9` - For camera functionality
- `geolocator: ^10.1.0` - For GPS location services
- `geocoding: ^2.1.1` - For converting coordinates to addresses
- `intl: ^0.19.0` - For date and time formatting
- `permission_handler: ^11.3.0` - For handling app permissions
- `shared_preferences: ^2.2.2` - For local data storage
- `path_provider: ^2.1.2` - For file system access
- `path: ^1.8.3` - For path manipulation

### Project Structure
```
lib/
├── models/
│   └── check_in_data.dart    # Data model for check-in information
├── screens/
│   ├── home_screen.dart      # Main screen with grid view
│   ├── check_in_screen.dart  # Camera and check-in screen
│   └── preview_screen.dart   # Image preview and submission screen
├── services/
│   └── storage_service.dart  # Local storage service
└── main.dart                 # App entry point
```

## Getting Started

1. Clone the repository
2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Platform Support
- Android
- iOS

## Permissions Required
- Camera access
- Location services
- Storage access

## Features in Detail

### Home Screen
- Displays a grid of captured check-in images
- Shows welcome message when no images are captured
- Floating action button to start new check-in
- Each image card displays:
  - Captured image
  - Timestamp
  - Location address

### Check-In Screen
- Camera preview
- Real-time location display
- Current date and time
- Check-in button to capture image

### Preview Screen
- Full-screen image preview
- Location and timestamp information
- Options to retake or submit the image

## Data Storage
- Images are stored in the device's local storage
- Check-in data (image path, location, timestamp) is stored using SharedPreferences
- Data persists between app sessions

## UI/UX Features
- Material Design 3 components
- Responsive layout for different screen sizes
- Dark overlay for better text readability
- Loading indicators for async operations
- Error handling for failed operations

## Future Enhancements
- Cloud storage integration
- User authentication
- Multiple check-in types
- Offline support
- Image filters and editing
- Export functionality
