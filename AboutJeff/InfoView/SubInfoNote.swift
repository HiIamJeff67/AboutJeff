import SwiftUI

struct SubInfoNote<InnerView: View>: View {
    let title: String
    let contents: [String]
    let color: Color
    private let innerContent: () -> InnerView

    init(
        title: String,
        contents: [String],
        color: Color,
        @ViewBuilder innerContent: @escaping () -> InnerView
    ) {
        self.title = title
        self.contents = contents
        self.color = color
        self.innerContent = innerContent
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(color)
                if !contents.isEmpty {
                    VStack (alignment: .leading, spacing: 8) {
                        ForEach (contents, id: \.self) { line in
                            HStack(alignment: .top, spacing: 6) {
                                Text("•")
                                    .font(.body)
                                    .foregroundStyle(color)
                                Text(line)
                                    .font(.body)
                                    .foregroundStyle(.secondary)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
            }

            Divider()
                .opacity(0.2)

            innerContent()
        }
        .padding(18)
        .background(
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.ultraThinMaterial)
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(Color.primary.opacity(0.08), lineWidth: 1)
                RoundedRectangle(cornerRadius: 4)
                    .fill(color)
                    .frame(width: 5)
                    .padding(.vertical, 10)
                    .padding(.leading, 4)
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
    }
}
