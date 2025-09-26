import SwiftUI

struct SubInfoBlock: View {
    let title: String
    let content: String
    let iconName: String
    let color: Color
    
    init(
        title: String,
        content: String,
        iconName: String,
        color: Color = .black
    ) {
        self.title = title
        self.content = content
        self.iconName = iconName
        self.color = color
    }
    
    var body: some View {
        HStack (alignment: .top, spacing: 12) {
           Image(systemName: iconName)
               .font(.title2)
               .foregroundStyle(color)
            VStack (alignment: .leading, spacing: 0) {
               Text(title)
                   .font(.headline)
                   .fontWeight(.bold)
               Spacer()
               Text(content)
                   .font(.body)
                   .multilineTextAlignment(.leading)
           }
       }
       .frame(maxWidth: 200, alignment: .leading)
       .padding(10)
       .background(.ultraThinMaterial)
       .clipShape(RoundedRectangle(cornerRadius: 16))
       .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
    }
}
