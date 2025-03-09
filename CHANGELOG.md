# Changelog

### Changed
- Updated `MeetingView()` to dynamically reflect the current scrum in `DetailView()`.
- Modified `NavigationLink` in `DetailView.swift` to pass `scrum` as a binding to `MeetingView()`.
- Enhanced UI in `MeetingView()`:
  - Applied `scrum.theme.mainColor` and `scrum.theme.accentColor` for theme-based styling.
  - Introduced a `MeetingView_StateWrapper` struct with `@State var scrum` for previewing.
- Refactored meeting header to a separate component (`MeetingHeaderView.swift`)

### Added
- Created new `MeetingHeaderView.swift` component with:
  - Progress visualization for meeting timeline
  - Display of seconds elapsed and seconds remaining
  - Proper accessibility labels and values
  - Preview functionality with `MeetingHeaderView_StateWrapper`

### Miscellaneous
- Updated `UserInterfaceState.xcuserstate` (Xcode workspace state changes).
