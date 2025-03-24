# Scrumdinger App Changes - Changelog

## File Renames
- `MeetingTimeView.swift` → `MeetingTimerView.swift` (Name correction for consistency)

## Structure Renames
- `MeetingTimeView` structure renamed to `MeetingTimerView` for consistency

## New Files Added
- Added `SpeakrArc.swift` implementing the `SpeakerArc` shape for visualizing speaker progress
  - Creates arcs representing each speaker's time allocation
  - Includes calculations for positioning speaker arcs around a circle
  - Implements the `Shape` protocol with `path(in:)` function

## UI Enhancements
- Enhanced `MeetingTimerView` with visual speaker progress tracking
  - Added overlay to display speaker arcs
  - Implemented ForEach loop to render completed speaker segments
  - Added rotation and stroke styling for speaker arcs

## File References Updated
- Updated `MeetingView.swift` to reference the renamed `MeetingTimerView` component

## Implementation Details
- `SpeakerArc` calculates angles based on speaker index and total speakers
- Each speaker gets an equal portion of the full 360° circle
- Arc drawing uses a small gap between segments (1° buffer)
- The view maintains proper scaling with padding and size calculations
