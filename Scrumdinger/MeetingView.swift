import SwiftUI
    
struct MeetingView: View {
	var body: some View {
		VStack {
			ProgressView(value: 5, total: 15)
			HStack {
				VStack (alignment: .leading){
					Text("Second Elapsed")
						.font(.caption)
					Label("300", systemImage: "hourglass.tophalf.fill")
				}
				Spacer()
				VStack (alignment: .trailing){
					Text("Second remaining")
						.font(.caption)
					Label("600", systemImage: "hourglass.bottomhalf.fill")
				}
			}
			.accessibilityElement(children:.ignore)
			.accessibilityLabel("Time remianing")
			.accessibilityValue("10 minutes")
			
			Circle()
				.strokeBorder(lineWidth: 24)
			
			HStack(){
				Text("Speaker 1 of 3")
				Spacer()
				Button(action:{}){
					Image(systemName: "forward.fill")
				}
			}
		}
		.padding()
	}
}
    
struct MeetingView_Previews: PreviewProvider {
	static var previews: some View {
		MeetingView()
	}
}
