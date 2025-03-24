//
//  MeetingTimeView.swift
//  Scrumdinger
//
//  Created by Tri Pham on 3/20/25.
//

import SwiftUI

struct MeetingTimerView: View {
	let speakers: [ScrumTimer.Speaker]
	let theme: Theme
	
	private var currentSpeaker: String{
		speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
	}
	
	var body: some View {
		Circle()
			.strokeBorder(lineWidth: 24)
			.overlay{
				Text("\(currentSpeaker) is speaking")
					.font(.title)
					.accessibilityElement(children: .combine)
					.foregroundColor(theme.accentColor)
			}
			.overlay{
				ForEach(speakers){speaker in
					if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }){
						SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
							.rotation(Angle(degrees: 0))
							.stroke(theme.mainColor, lineWidth: 12)
					}
				}
			}
			.padding(.horizontal)
	}
}

#Preview {
	MeetingTimerView(speakers:
							[ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)],
						 theme: .bubblegum
						)
}
