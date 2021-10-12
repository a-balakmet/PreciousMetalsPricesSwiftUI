import SwiftUI

struct NoNetWindow: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(LocalizedStringKey("no_net"))
            Button(action: {
                exit(0)
            }, label: {
                HStack{
                    Spacer()
                    Text("OK").font(.title).padding().foregroundColor(.black)
                    Spacer()
                }
                .background(CornerRadiusShape(radius: 25, corners: [UIRectCorner.topLeft, UIRectCorner.topRight, UIRectCorner.bottomLeft, UIRectCorner.bottomRight]).fill(Color("HalfToneColor")))
            })
        .background(CornerRadiusShape(radius: 25, corners: [UIRectCorner.topLeft, UIRectCorner.topRight, UIRectCorner.bottomLeft, UIRectCorner.bottomRight]).fill(Color("BackgroundColor")))
        .frame(width: 300, height: 200, alignment: .center)
        }
    }
}

struct NoNetWindow_Previews: PreviewProvider {
    static var previews: some View {
        NoNetWindow()
    }
}
