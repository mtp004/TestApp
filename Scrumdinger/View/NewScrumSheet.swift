//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Tri Pham on 3/11/25.
//

import SwiftUI

struct NewScrumSheet: View {
	@Binding var scrums: [DailyScrum]
	@Binding var isPresentingNewScrumView: Bool
	@State private var newScrum = DailyScrum.emptyScrum
	var body: some View {
	 NavigationStack{
		 DetailEditView(scrum: $newScrum)
			 .toolbar{
				ToolbarItem(placement: .cancellationAction) {
					Button("Dismiss"){
						isPresentingNewScrumView = false
					}
				}
				ToolbarItem(placement: .confirmationAction) {
					Button("Add"){
						scrums.append(newScrum)
						isPresentingNewScrumView = false
					}
				}
			}
		}
	}
}

struct NewScrumSheet_Previews: PreviewProvider {
	static var previews: some View {
		NewScrumSheet_StateWrapper(scrums: DailyScrum.sampleData)
	}
}

struct NewScrumSheet_StateWrapper: View {
	@State var scrums: [DailyScrum]
	
	var body: some View {
		NewScrumSheet(scrums: $scrums ,isPresentingNewScrumView: .constant(true))
	}
}


