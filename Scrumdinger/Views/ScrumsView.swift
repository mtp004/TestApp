/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct ScrumsView: View {
	@Binding var scrums: [DailyScrum]
	@Environment(\.scenePhase) private var scenePhase
	@State private var isPresentingNewScrumView = false
	@State private var isShowingDeleteConfirmation = false
	@State private var indexToDelete: IndexSet?
	
	let saveAction: () -> Void
	
	var body: some View {
		NavigationStack {
			List {
				ForEach($scrums) { $scrum in
						  NavigationLink(destination: DetailView(scrum: $scrum)) {
								CardView(scrum: scrum)
						  }
						  .swipeActions(edge: .trailing) {
								Button {
									 // Break this into simpler steps
									 let scrumId = scrum.id
									 if let index = scrums.firstIndex(where: { $0.id == scrumId }) {
										  indexToDelete = IndexSet([index])
										  isShowingDeleteConfirmation = true
									 }
								} label: {
									Label("Delete", systemImage: "trash")
								}
								.tint(.red)
						  }
						  .listRowBackground(scrum.theme.mainColor)
					 }
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
		.alert("Are you sure you want to delete this scrum?", isPresented: $isShowingDeleteConfirmation, actions: {
						Button("Cancel", role: .cancel) {
							indexToDelete = nil
						}
						Button("Delete", role: .destructive) {
							 if let indexSet = indexToDelete {
								  scrums.remove(atOffsets: indexSet)
								  indexToDelete = nil
							 }
						}
				  })
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
