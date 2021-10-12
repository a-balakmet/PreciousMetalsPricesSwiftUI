import SwiftUI

struct LoadingWindow: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(LocalizedStringKey("loading")).padding()
            ProgressView()
                .scaleEffect(1.5)
                .progressViewStyle(CircularProgressViewStyle(tint: Color("AccentColor")))
                .padding()
        }
        .background(CornerRadiusShape(radius: 25, corners: [UIRectCorner.topLeft, UIRectCorner.topRight, UIRectCorner.bottomLeft, UIRectCorner.bottomRight]).fill(Color("BackgroundColor")))
        .frame(width: 300, height: 200, alignment: .center)
    }
}

struct LoadingWindow_Previews: PreviewProvider {
    static var previews: some View {
        LoadingWindow()
    }
}
