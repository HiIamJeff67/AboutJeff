import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool = false
        
    func toggleTheme() {
        isDarkMode.toggle() // same as `isDarkMode = !isDarkMode`
    }
}
