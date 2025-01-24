


import SwiftUI

struct CostView: View {
    @State private var showIndividualNote = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Black Banner at the Top
                ZStack {
                    Color.black
                        .ignoresSafeArea(edges: .top) // Black background spanning the full width
                        .frame(height: 130)

                    Image("cost25")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width * 1.9, maxHeight: 90)
                        .multilineTextAlignment(.center)
                }

                // Content Area
                ScrollView {
                    ZStack {
                        // Black background below the entire content area
                        Color.black
                            .ignoresSafeArea()

                        // Background Image
                        Image("cost bkg")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()

                        VStack {
                            // General Admission and Pastor/Spouse Prices
                            Image("GA price")
                                .resizable()
                                .frame(width: 365.0, height: 185.0)
                                .position(x: 180, y: 100)

                            // Early Bird, Crown, and Youth Staff Prices
                            Image("early")
                                .resizable()
                                .frame(width: 340.0, height: 100.0)
                                .position(x: 187, y: 115)

                            // Buttons Section: Group Registration and Individuals
                            VStack(spacing: 10) {
                                // Group Registration Button
                                Link(destination: URL(string: "https://your-group-registration-link.com")!) {
                                    Image("groups")
                                        .resizable()
                                        .frame(width: 300, height: 75)
                                        .position(x: 185, y: 65)
                                }

                                // Individuals Button
                                Button(action: {
                                    showIndividualNote = true
                                }) {
                                    Image("individuals")
                                        .resizable()
                                        .frame(width: 300, height: 60)
                                        .position(x: 187, y: 55)
                                }
                                .alert(isPresented: $showIndividualNote) {
                                    Alert(
                                        title: Text("Notice"),
                                        message: Text("If you are an individual, please sign up with your group. LCStudents, please sign up using our direct link."),
                                        dismissButton: .default(Text("Got it!"))
                                    )
                                }
                            }

                            // Merch Estimates Section
                            Image("merch")
                                .resizable()
                                .frame(width: 400, height: 210.0)
                                .position(x: 185, y: 125)

                            // Pre-Order Button
                            Link(destination: URL(string: "https://lccmilford.churchcenter.com/registrations")!) {
                                Image("ordershoe")
                                    .resizable()
                                    .frame(width: 325, height: 60)
                                    .position(x: 185, y: 118)
                            }

                            // Disclaimer Image
                            Image("estimate")
                                .resizable()
                                .frame(width: 350, height: 20)
                                .position(x: 185, y: 60)
                        }
                    }
                }
            }
            .background(Color.black) // Adds a global black background
            .navigationBarTitle("")
            .navigationBarHidden(true) // Ensure navigation bar doesn’t interfere
        }
    }
}

#Preview {
    CostView()
}
