//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Tri Pham on 2/14/25.
//

import SwiftUI

struct ScrumsView: View {
	@Binding var scrums: [DailyScrum]
	
	var body: some View {
		NavigationStack{
			List($scrums, id: \.id) {
				$scrums in
				NavigationLink(destination: DetailView(scrum: $scrums)){
					CardView(scrum: scrums)
				}
				.listRowBackground(scrums.theme.mainColor)
			}
			.navigationTitle("Daily Scrums")
			.toolbar{
				Button(action: {}){
					Image(systemName: "plus")
				}
				.accessibilityLabel("New Scrum")
			}
		}
	}
}


struct ScrumsView_Previews: PreviewProvider {
	static var previews: some View {
		ScrumsView_StateWrapper(scrums: DailyScrum.sampleData)
	}
}

struct ScrumsView_StateWrapper: View {
	@State var scrums: [DailyScrum]
	 var body: some View {
		ScrumsView(scrums: $scrums)
	}
}
