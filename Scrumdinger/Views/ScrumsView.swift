/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct ScrumsView: View {
	@Binding var scrums: [DailyScrum]
	@Environment(\.scenePhase) private var scenePhase
	@State private var isPresentingNewScrumView = false
	let saveAction: () -> Void
	
	var body: some View {
		NavigationStack {
			List {
				ForEach($scrums) {$scrum in
					NavigationLink(destination: DetailView(scrum: $scrum)) {
						CardView(scrum: scrum)
					}
					.listRowBackground(scrum.theme.mainColor)
				}
				.onDelete(perform: DeleteScrum)
			}
			.navigationTitle("Daily Scrums")
			.toolbar {
				Button(action: {
					isPresentingNewScrumView = true
				}) {
					Image(systemName: "plus")
				}
				.accessibilityLabel("New Scrum")
			}
		}
		.sheet(isPresented: $isPresentingNewScrumView) {
			NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
		}
		.onChange(of: scenePhase) {oldPhase, newPhase in
			if newPhase == .inactive {
				saveAction()
			}
		}
	}
	
	func DeleteScrum(at offsets: IndexSet){
		scrums.remove(atOffsets: offsets)
	}
}

struct ScrumsView_Previews: PreviewProvider {
	static var previews: some View {
		ScrumsView_StateWrapper()
	}
}

struct ScrumsView_StateWrapper: View{
	@State var scrums = DailyScrum.sampleData
	var body: some View {
		ScrumsView(scrums: $scrums, saveAction: {})
	}
}
