# Changelog

## [Unreleased]
### Added
- Introduced `MeetingTimeView.swift` to display the current speaker during a scrum meeting.
- Implemented `MeetingTimeView` into `MeetingView.swift`, replacing the generic circle placeholder.
- Added swipe-to-delete functionality in `ScrumsView.swift`, allowing users to delete scrums with a confirmation dialog.

### Changed
- Refactored `MeetingView.swift` to integrate `MeetingTimeView`, improving readability and maintainability.
- Updated `ScrumsView.swift` to include a deletion confirmation alert, preventing accidental scrum deletions.

### Fixed
- Fixed UI alignment issues in `MeetingView.swift` by replacing a generic `Circle` with `MeetingTimeView`.
- Resolved an issue where `ScrumsView.swift` would immediately delete scrums without user confirmation.

### Removed
- Removed the old inline circle-based timer display in `MeetingView.swift`, replacing it with the more informative `MeetingTimeView`.


