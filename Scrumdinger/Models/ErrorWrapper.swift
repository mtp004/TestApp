//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Tri Pham on 3/17/25.
//

import Foundation

struct ErrorWrapper: Identifiable{
	let id: UUID
	let error: Error
	let message: String
	
	init(id: UUID = UUID(), error: Error, message: String) {
		self.id = id
		self.error = error
		self.message = message
	}
}
