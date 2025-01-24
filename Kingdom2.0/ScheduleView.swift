

import SwiftUI

struct ScheduleView: View {
    // Track the current page
    @State private var selectedPage = 0
    let pages = ["friday", "saturday"]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Black Banner at the Top
                ZStack {
                    Color.black
                        .ignoresSafeArea(edges: .top) // Black background spanning the full width
                        .frame(height: 130)

                    Image("schedule25")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width * 1.9, maxHeight: 90)
                        .multilineTextAlignment(.center)
                }

                // Scrollable Content Area
                ScrollView {
                    ZStack {
                        // Black Base Background
                        Color.black
                            .ignoresSafeArea()

                        // Background Image
                        Image("schedule bkg")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()

                        VStack(spacing: -55) { // Reduced spacing for closer layout
                            // Swipe Arrows
                            Image("swipe")
                                .resizable()
                                .frame(width: 150, height: 30)
                                .padding(.top, -40)

                            // Swipeable Images (Friday & Saturday)
                            TabView(selection: $selectedPage) {
                                ForEach(0..<pages.count, id: \.self) { index in
                                    Image(pages[index])
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.horizontal, 20) // Add horizontal padding if needed
                                        .tag(index) // Tag to track the page
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default dots
                            .frame(height: UIScreen.main.bounds.height * 0.7) // Ensure proper height for images
                        }
                    }
                }
            }
            .navigationBarTitle("") // Empty title
            .navigationBarHidden(true) // Hide the default navigation bar
        }
    }
}

#Preview {
    ScheduleView()
}
