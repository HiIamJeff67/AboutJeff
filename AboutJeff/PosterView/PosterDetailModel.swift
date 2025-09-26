import SwiftUI

struct PosterDetailModal: View {
    let item: PosterItem
    @Binding var isPresented: Bool

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.opacity(0.55)
                    .ignoresSafeArea()
                    .onTapGesture { dismiss() }

                let w = min(geo.size.width * 0.8, 820)
                let h = min(geo.size.height * 0.8, 900)

                ZStack(alignment: .topTrailing) {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: h * 0.38)
                                .frame(maxWidth: .infinity)
                                .clipped()
                                .overlay(
                                    LinearGradient(
                                        colors: [.clear, .black.opacity(0.55)],
                                        startPoint: .center,
                                        endPoint: .bottom
                                    )
                                )

                            YouTubePlayerView(embedURL: item.embedURL)
                                .frame(height: 220)
                                .padding(.horizontal, 24)
                                .padding(.top, -40)

                            VStack(alignment: .leading, spacing: 18) {
                                Text(item.title)
                                    .font(.title2.bold())

                                Text(item.subtitle)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)

                                Text(item.description)
                                    .font(.body)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.horizontal, 24)
                            .padding(.top, 16)
                            .padding(.bottom, 40)
                            .frame(maxWidth: 680, alignment: .leading)
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))

                    Button(action: dismiss) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.white.opacity(0.95))
                            .shadow(radius: 4)
                            .padding(14)
                    }
                    .accessibilityLabel("關閉")
                }
                .frame(width: w, height: h)
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(.ultraThinMaterial)
                        .shadow(color: .black.opacity(0.25), radius: 28, y: 16)
                )
            }
        }
        .interactiveDismissDisabled(true)
    }

    private func dismiss() {
        withAnimation(.easeOut(duration: 0.25)) {
            isPresented = false
        }
    }
}
