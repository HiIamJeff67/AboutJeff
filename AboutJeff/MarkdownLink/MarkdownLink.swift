import SwiftUI

struct MarkdownLink: View {
    let label: String
    let url: String
    var font: Font = .body
    var color: Color? = nil
    var systemImage: String? = nil
    var bold: Bool = false

    var body: some View {
        let md = "[\(label)](\(url))"
        let linkText = Text(.init(md))

        HStack(spacing: 6) {
            if let systemImage {
                Image(systemName: systemImage)
            }
            (bold ? linkText.bold() : linkText)
        }
        .font(font)
        .foregroundStyle(color ?? .accentColor)
        .environment(\.openURL, OpenURLAction { openedURL in
            return .systemAction
        })
        .accessibilityLabel(label)
    }
}

extension MarkdownLink {
    static func github(user: String, repo: String? = nil) -> MarkdownLink {
        let base = "https://github.com/\(user)"
        return MarkdownLink(
            label: repo == nil ? "\(user) on GitHub" : "\(repo!) Repo",
            url: repo == nil ? base : base + "/\(repo!)",
            font: .callout,
            color: .blue,
            systemImage: "link"
        )
    }
}
