//
//  ThemePickView.swift
//  Scrumdinger
//
//  Created by Tri Pham on 3/4/25.
//

import SwiftUI

struct ThemePickView: View {
	@Binding var selectedTheme: Theme
    var body: some View {
		 Picker("Theme", selection: $selectedTheme){
			 ForEach(Theme.allCases, id: \.id){
				 theme in ThemeView(theme: theme).tag(theme)
			 }
		 }
		 .pickerStyle(.navigationLink)
    }
}

#Preview {
	ThemePickView(selectedTheme: .constant(.bubblegum))
}
