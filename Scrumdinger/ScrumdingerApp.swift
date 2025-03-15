/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

@main
struct ScrumdingerApp: App {
	 @StateObject private var storage = ScrumStore()

	 var body: some Scene {
		WindowGroup {
			ScrumsView(scrums: $storage.scrums){
				Task{
					do{
						try await storage.save(scrums: storage.scrums)
					} catch{
						fatalError(error.localizedDescription)
					}
				}
			}
				.task{
				do{
					try await storage.load()
				} catch{
					fatalError(error.localizedDescription)
				}
			}
		}
	}
}
