//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Tri Pham on 3/3/25.
//

import SwiftUI

struct DetailEditView: View {
	@State private var scrum = DailyScrum.emptyScrum
	@State private var newAttendeeName = ""
	
    var body: some View {
		Form {
			Section(header: Text("Meeting Info")){
				TextField("Title", text: $scrum.title)
				HStack{
					Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1){
						Text("Length in minutes")
					}
					Spacer()
					Text("\(scrum.lengthInMinutes) minutes")
				}
			}
			Section(header: Text("Attendees")){
				ForEach(scrum.attendees){
					attendee in Text(attendee.name)
				}
				.onDelete(perform: {(indice: IndexSet) -> Void in scrum.attendees.remove(atOffsets: indice)
				})
				HStack{
					TextField("New attendee", text: $newAttendeeName)
					Button(action: {
						withAnimation{
							let attendees = DailyScrum.Attendee(name: newAttendeeName)
							scrum.attendees.append(attendees)
							newAttendeeName = ""
						}
					}) {
						Image(systemName: "plus.circle.fill")
					}
				}
			}
		}
    }
}

#Preview {
    DetailEditView()
}
