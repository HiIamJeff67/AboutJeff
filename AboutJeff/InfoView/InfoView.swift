import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 12) {
            HStack (alignment: .top, spacing: 12) {
                SubInfoBlock(
                    title: "學歷",
                    content: "資訊工程學系大學四年級生",
                    iconName: "book.fill",
                    color: .blue,
                )
                .frame(width: 180)
                SubInfoBlock(
                    title: "工作",
                    content: "外商自動化工程師實習生",
                    iconName: "bag.fill",
                    color: .brown,
                )
                .frame(width: 180)
            }
            HStack (alignment: .top, spacing: 12) {
                SubInfoBlock(
                    title: "多人專案經驗",
                    content: "主導過機車共乘系統開發",
                    iconName: "hammer.fill",
                    color: .orange,
                )
                .frame(width: 180)
                SubInfoBlock(
                    title: "個人專案",
                    content: "前後端測試、管理一手包",
                    iconName: "laptopcomputer",
                    color: .gray,
                )
                .frame(width: 180)
            }
            
            SubInfoNote(
                title: "Highlight",
                contents: [
                    "Gacha Simulator：運用 MERN (MongoDB, Express, React, Node.js) Stack 結合 Firebase 作為身份驗證和檔案儲存的網站。",
                    "MotoShare：透過 PosgreSQL, React Native, TailwindCSS, NestJS(RESTful, WebSocket) 完成的機車共乘系統，有使用一些外部工具像是 Neon, Google map, Stripe API, Vercel, Render 等，功能及其完整，並且提供乘客和車主的交易功能。",
                    "Notezy：升級原有架構，前端加入 NextJS 框架以及 TanStack Query，後端改用 Golang 的 Gin, Gorm Stack 製作的 RESTful API，並在前後端都導入 GraphQL，目前為完全單人，開發內容設計網站、桌面以及手機軟體，預計透過 AWS 部署，主要功能尚在開發，但登入驗證跟完整架構以及規格書、Class Diagram、Database Schema 等都已完成。"
                ],
                color: .blue,
            ) {
                VStack (alignment: .leading, spacing: 8) {
                    MarkdownLink(label: "My Github Link", url: "https://github.com/HiIamJeff67", font: .headline, color: .blue, systemImage: "chevron.right", bold: true)
                    MarkdownLink.github(user: "HiIamJeff67")
                    MarkdownLink.github(user: "HiIamJeff67", repo: "AboutJeff")
                }
            }
            .frame(width: .infinity)
            
            SubInfoNote(
                title: "Additional",
                contents: [
                    "個人興趣包含看動漫，基本上都會先試片再慢慢追下去，以前就受好友推坑鏈鋸人，看了動畫後最近去看了劇場版蕾塞篇，看完後真的「心痛爆擊」，深深感謝製作組和導演非常用心製作這個電影，在視覺跟聽覺以及心理上造成了相當大的震撼和無法挽回的影響，總而言之是一部非常值得看的電影，故在此放一些相關的 PV 還有劇場版縮圖，點擊下方連結後即可打開，打開後的嵌入式 YouTube 影片可能會需要一些時間載入，並且可能會有影片載入失敗的問題，如果遇到還請請多嘗試重新開啟...",
                ],
                color: .purple,
            ) {
                
            }
            .frame(width: .infinity)
        }
        .padding(12)
    }
}
