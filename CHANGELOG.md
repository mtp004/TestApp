# Changelog  

## [72e613f] - 2025-03-10  

### Added  
- Implemented `MeetingFooterView` to display speaker information and a skip button.  
- Introduced `scrumTimer` in `MeetingView` to manage scrum timing.  
- `MeetingView` now includes a header (`MeetingHeaderView`) displaying elapsed and remaining time.  

### Updated  
- Replaced the manual speaker tracking UI in `MeetingView` with `MeetingFooterView`.  
- `MeetingView` now resets and starts the `scrumTimer` on appear, and stops it on disappear.  

### Fixed  
- Skip speaker button is now functional and updates the current active speaker.  

