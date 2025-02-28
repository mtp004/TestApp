//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Tri Pham on 2/27/25.
//

import SwiftUI

struct DetailView: View {
	let scrum: DailyScrum
	var body: some View {
		Text("This meeting is about \(scrum.title)")
    }
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		DetailView(scrum: DailyScrum.sampleData[0])
	}
}
