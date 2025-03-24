//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Tri Pham on 3/17/25.
//

import SwiftUI

struct ErrorView: View {
	let errorWrapper: ErrorWrapper
	@Environment(\.dismiss) private var dismiss
	
	var body: some View {
		NavigationStack {
			VStack{
			 Text("An error has occurred!")
				 .font(.title)
				 .padding(.bottom)
			 Text(errorWrapper.error.localizedDescription).font(.headline)
				Text(errorWrapper.guidance)
				 .font(.caption)
				 .padding(.top)
			 Spacer()
			}
			.padding()
			.background(.ultraThinMaterial)
			.cornerRadius(16)
			.toolbar{
				ToolbarItem(placement: .navigationBarTrailing){
					Button("Dismiss"){
						dismiss()
					}
				}
			}
		}
	}
}

#Preview {
    ErrorView_StateWrapper()
}

struct ErrorView_StateWrapper: View{
	enum SampleError: Error{
		case errorRequired
	}
	
	static var wrapper: ErrorWrapper{
		ErrorWrapper(error: SampleError.errorRequired, guidance: "Sample error")
	}
	
	var body: some View{
		ErrorView(errorWrapper: Self.wrapper)
	}
}
