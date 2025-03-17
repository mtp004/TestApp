/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

@main
struct ScrumdingerApp: App {
	@StateObject private var storage = ScrumStore()
	@State private var errorWrapper: ErrorWrapper?

	var body: some Scene {
		WindowGroup {
			ScrumsView(scrums: $storage.scrums){
				Task{
					do{
						try await storage.save(scrums: storage.scrums)
					} catch{
						errorWrapper = ErrorWrapper(error: error, message: "Try again later.")
					}
				}
			}
				.task{
				do{
					try await storage.load()
				} catch{
					errorWrapper = ErrorWrapper(error: error, message: "Scrumdinger will load sample data and continue.")
				}
			}.sheet(item: $errorWrapper){
				storage.scrums = DailyScrum.sampleData
			} content: {
				wrapper in ErrorView(errorWrapper: wrapper)
			}
		}
	}
}
