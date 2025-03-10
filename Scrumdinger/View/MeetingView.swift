import SwiftUI
	 
struct MeetingView: View {
	@Binding var scrum: DailyScrum
	@StateObject var scrumTimer = ScrumTimer()
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 16).fill(scrum.theme.mainColor)
			VStack {
				MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed ,secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
				Circle()
					.strokeBorder(lineWidth: 24)
				MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
			}
			.padding()
		}
		.foregroundColor(scrum.theme.accentColor)
		.navigationBarTitleDisplayMode(.inline)
		.onAppear{
			scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
			scrumTimer.startScrum()
		}
		.onDisappear{
			scrumTimer.stopScrum()
		}
	}
}
	 
struct MeetingView_Previews: PreviewProvider {
	static var previews: some View {
		MeetingView_StateWrapper(scrum: DailyScrum.sampleData[0])
	}
}

struct MeetingView_StateWrapper: View {
	@State var scrum: DailyScrum
	var body: some View {
		MeetingView(scrum: $scrum)
	}
}
