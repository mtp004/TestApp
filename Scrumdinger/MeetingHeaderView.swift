//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Tri Pham on 3/7/25.
//

import SwiftUI

struct MeetingHeaderView: View {
	let secondsElapsed: Int
	let secondsRemaining: Int
	
	private var totalSeconds: Int {
		secondsElapsed + secondsRemaining
	}
	
	private var progress: Double {
		guard totalSeconds > 0 else {return 1}
		return Double(secondsElapsed) / Double(totalSeconds)
	}
	
	private var minutesRemaining: Int {
		secondsRemaining / 60
	}
	
	var body: some View {
		VStack{
			ProgressView(value: progress)
			HStack {
				VStack (alignment: .leading){
					Text("Second Elapsed")
						.font(.caption)
					Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
				}
				Spacer()
				VStack (alignment: .trailing){
					Text("Second remaining")
						.font(.caption)
					Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
				}
			}
			.accessibilityElement(children:.ignore)
			.accessibilityLabel("Time remaining")
			.accessibilityValue("\(minutesRemaining) minutes")
		}
	}
}

struct MeetingHeaderView_Previews: PreviewProvider {
	static var previews: some View {
		MeetingHeaderView_StateWrapper()
	}
}

struct MeetingHeaderView_StateWrapper: View {
	//@State var someBindingVar
	
	var body: some View {
		MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180).previewLayout(.sizeThatFits)
	}
}


