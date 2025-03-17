# Changelog

## Version 1.0.2 - March 17, 2025

### Added
- Implemented error handling with user-friendly error messages
- Created new ErrorWrapper model to encapsulate error information
- Added ErrorView to display errors to users
- Sheet presentation for errors with dismiss functionality

### Changed
- Replaced fatal errors with graceful error handling
- App now loads sample data when errors occur during data loading
- Improved user experience by providing clear error messages
- Enhanced error recovery with dismissible error sheets

### Technical Details
- Created ErrorWrapper struct with Identifiable conformance
- Added ErrorView with material background and rounded corners
- Implemented preview for ErrorView using sample error
- Modified ScrumdingerApp to use the new error handling system

## Version 1.0.1 - March 15, 2025

### Added
- Implemented persistent data storage functionality
- Added data loading on app launch
- Added automatic data saving when app enters background

### Changed
- Replaced hardcoded sample data with dynamic data loading
- Modified ScrumsView to support data persistence
- Updated ScrumdingerApp to handle data loading and saving

### Technical Details
- Created a new ScrumStore class to manage data persistence
- Added error handling for data loading and saving operations
- Implemented scene phase monitoring to trigger data saving when app becomes inactive
- Updated preview providers to work with the new data handling approach

### Fixed
- App now retains user changes between sessions
