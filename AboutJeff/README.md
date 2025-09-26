# AboutJeff

個人簡介與興趣展示 SwiftUI 專案。包含：自我介紹卡片、履歷亮點、主題切換（深淺色）、可點擊的動畫海報與 YouTube 影片內嵌播放視窗。

## 功能概覽
- 個人資訊區塊（教育 / 經歷 / 專案 Highlight）  
- 可切換 Light / Dark Mode  
- 海報卡片點擊後彈出置中 80% 視窗，內含海報背景 + 影片 + 簡介  
- 使用 `YouTubePlayerView` 以 WKWebView 內嵌播放  
- 使用多個自訂 View 與資料模型分離  
- 使用 `.ultraThinMaterial` 玻璃質感 (Liquid glass)  
- 使用 SF Symbols 並加入動畫 `.symbolEffect(.bounce)`  

## ! 特別注意 !
- 因為我最近看了鏈鋸人蕾潔篇，實在太過於好看，所以把它做成精美的 Poster，並以類似 App Store 主頁預覽那樣的效果，點擊後會展開，裡面有個 YouTube 影片（載入可能需要時間，有時候會載入失敗請多嘗試幾次），希望這部分可以作為加分，請教授再多留意謝謝。

| 項目 | 說明 | 已完成位置 |
| ---- | ---- | ---------- |
| 1 | 使用 VStack / HStack / ZStack / Text / Image / ScrollView | `ContentView.swift`, `InfoView.swift`, `PosterCardView.swift`, `PosterDetailView.swift` |
| 2 | 圖片含 Asset 與 SF Symbol | Asset: `ChainsawManRezePoster`; SF Symbols: `heart.fill`, `moon.fill`, `sun.max.fill`, `book.fill`, `bag.fill`, `hammer.fill`, `laptopcomputer`, `chevron.right`, `xmark.circle.fill` |
| 3 | 多個 modifier | 各 View（例：`PosterCardView` 圖片裁切、陰影、圓角；`ContentView` toolbar 修飾） |
| 4 | 畫面可上下捲動 | `ContentView.swift` 外層 `ScrollView`; Modal 內 `PosterDetailView` 的 `ScrollView` |
| 5 | 定義多個 View 型別 | `InfoView`, `MarkdownLink`, `PosterCardView`, `PosterDetailView`, `YouTubePlayerView`,（以及子組件） |
| 6 | 使用 property 客製 View | `PosterCardView(item:onTap:)`, `MarkdownLink(label:url:...)`, `PosterDetailView(item:...)` |
| 7 | Light / Dark Mode | `ThemeManager` + `ContentView` `preferredColorScheme` 切換 |
| 8 | Liquid glass 效果 | 多處 `.background(.ultraThinMaterial)`：`PosterCardView`, `PosterDetailView`, toolbar 背景 |
| 9 | SF Symbol animation | `ContentView` 中 `Image(systemName:) .symbolEffect(.bounce, value: themeManager.isDarkMode)` |

## 主要檔案職責
- `ContentView.swift`：整體導航、主題切換、聚合 Info + Poster 區塊  
- `ThemeManager.swift`：暗 / 亮模式狀態  
- `InfoView.swift`：個人資料格狀資訊與連結  
- `MarkdownLink.swift`：Markdown 標記連結元件  
- `PosterItem.swift`：海報資料模型與 embed URL  
- `PosterCardView.swift`：海報卡片  
- `PosterDetailView.swift`：置中彈出視窗（80% 尺寸）含圖片 / 影片 / 文本  
- `YouTubePlayerView.swift`：WKWebView 包裝成 SwiftUI View  

## 可再優化
- 加入 `PosterView.swift`（若尚未實作）集中管理狀態  
- 增加多張海報與水平捲動  
- 加入無網路時的影片載入提示  
- 保留/恢復 `matchedGeometryEffect` 達成更平滑轉場（目前為穩定優先）  

## 授權
僅作個人學習與作品展示。
