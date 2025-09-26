import SwiftUI

struct PosterView: View {
    @State private var showDetail = false

    private let poster = PosterItem(
        imageName: "ChainsawManRezePoster",
        title: "チェンソーマンレゼ篇",
        subtitle: "Reze Arc PV",
        youtubeID: "GJ1jrCnm-t8",
        description: """
故事銜接電視動畫第一季。獲得「鏈鋸惡魔」變身能力的淀治如今是對魔特異4課的惡魔獵人。與夢中情人真紀真約會後，淀治在雨天邂逅了在咖啡廳打工的神秘少女蕾潔，兩人感情也迅速增溫，然而看似清純的蕾潔卻藏著致命的秘密⋯⋯
""",
        accent: .pink
    )

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            PosterCardView(item: poster) {
                withAnimation(.easeInOut(duration: 0.25)) {
                    showDetail = true
                }
            }
            .padding(.top, 50)
            .padding(.horizontal, 24)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .fullScreenCover(isPresented: $showDetail) {
            PosterDetailModal(item: poster, isPresented: $showDetail)
        }
    }
}
