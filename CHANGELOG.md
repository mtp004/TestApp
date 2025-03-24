# Changelog

## [Unreleased]

### Added
- New `SpeechRecognizer.swift` model to support speech recognition functionality
- Added microphone and speech recognition usage description keys in project configuration

### Changed
- Updated `ErrorWrapper` struct:
  - Renamed `message` property to `guidance`
- Modified `ScrumStore.swift`:
  - Updated file URL creation to use `create: false` instead of `create: true`
  - Minor code formatting improvements
- Updated `ScrumdingerApp.swift` to use the new `guidance` property in `ErrorWrapper`
- Updated `ErrorView.swift` to display the new `guidance` property

### Refactored
- Standardized code comments to use multi-line comment style with licensing information
- Improved error handling in speech recognition and file storage operations

### Fixed
- Corrected initialization of error handling in app storage and loading processes
