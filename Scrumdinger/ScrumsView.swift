//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Tri Pham on 2/14/25.
//

import SwiftUI

struct ScrumsView: View {
	let scrums: [DailyScrum]
	
	var body: some View {
		List(scrums, id: \.title) {
			scrums in CardView(scrum: scrums)
		}
	}
}

struct ScrumsView_Previews: PreviewProvider {
	static var previews: some View {
		ScrumsView(scrums: DailyScrum.sampleData)
	}
}
