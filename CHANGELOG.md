## [Unreleased]

### Changed
- Updated `MeetingView()` to dynamically reflect the current scrum in `DetailView()`.
- Modified `NavigationLink` in `DetailView.swift` to pass `scrum` as a binding to `MeetingView()`.
- Refactored `MeetingView.swift`:
  - Added `@Binding var scrum: DailyScrum` to track scrum details.
  - Wrapped `MeetingView` inside a `ZStack` with a `RoundedRectangle` for improved UI.
  - Applied `scrum.theme.mainColor` and `scrum.theme.accentColor` for theme-based styling.
  - Introduced a `MeetingView_StateWrapper` struct with `@State var scrum` for previewing.

### Miscellaneous
- Updated `UserInterfaceState.xcuserstate` (Xcode workspace state changes).

