

import SwiftUI

struct KingdomGramView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Black Header with "post share" image
            ZStack {
                Color.black
                    .ignoresSafeArea(edges: .top) // Black background for the top area
                    .frame(height: 100)

                Image("KingdomGram") // Asset for the "Digital Album" text
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60) // Adjust height as needed
                    .padding(.top, 20)
            }

            // WebView for the digital album
            WebView(urlString: "https://app.kululu.com/5rwg4v")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    KingdomGramView()
}
