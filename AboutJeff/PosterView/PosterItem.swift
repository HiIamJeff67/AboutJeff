import SwiftUI

struct PosterItem: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    let youtubeID: String
    let description: String
    let accent: Color

    var embedURL: URL {
        URL(string: "https://www.youtube-nocookie.com/embed/\(youtubeID)?playsinline=1")!
    }
}
