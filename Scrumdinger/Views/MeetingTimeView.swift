//
//  MeetingTimeView.swift
//  Scrumdinger
//
//  Created by Tri Pham on 3/20/25.
//

import SwiftUI

struct MeetingTimeView: View {
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
	}
}

#Preview {
	MeetingTimeView(speakers:
							[ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)],
						 theme: .bubblegum
						)
}
