import SwiftUI

struct ContentView: View {
    @StateObject private var themeManager = ThemeManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    InfoView()
                    PosterView()
                }
                .navigationTitle("About Jeff")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: themeManager.toggleTheme) {
                            Image(systemName: "heart.fill")
                            Text("Buy me a coffee !")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: themeManager.toggleTheme) {
                            Image(systemName: themeManager.isDarkMode ? "sun.max.fill" : "moon.fill")
                                .font(.title3)
                                .foregroundStyle(themeManager.isDarkMode ? .orange : .blue)
                                .symbolEffect(.bounce, value: themeManager.isDarkMode)
                        }
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                    }
                }
                .toolbarColorScheme(themeManager.isDarkMode ? .dark : .light, for: .navigationBar)
                .toolbarBackground(themeManager.isDarkMode ? .black.opacity(0.8) : .white.opacity(0.9), for: .navigationBar)
            }
        }
        .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
