



import SwiftUI

struct ShareAndEarnView: View {
    @State private var showDownloadOptions = false
    @State private var showDidSharePrompt = false
    @State private var showHonestyPrompt = false
    @State private var showDiscountCode = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Black Header
                ZStack {
                    Color.black
                        .ignoresSafeArea(edges: .top) // Black background spanning the full width
                        .frame(height: 130)

                    Image("share earn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width * 1.9, maxHeight: 90)
                        .multilineTextAlignment(.center)
                }

                // Content Area
                ScrollView {
                    ZStack {
                        // Black Background Layer
                        Color.black
                            .ignoresSafeArea()

                        // Background Image
                        Image("map bkg")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()

                        VStack(spacing: 20) {
                            // Grab, Share & Save Image
                            Image("gss")
                                .resizable()
                                .frame(width: 375, height: 450)
                                .position(x: 187, y: 220)

                            // Download Photos Button
                            Button(action: {
                                showDownloadOptions = true
                            }) {
                                Image("downloads")
                                    .resizable()
                                    .frame(width: 360, height: 70)
                                    .position(x: 187, y: 140)
                            }
                            .actionSheet(isPresented: $showDownloadOptions) {
                                ActionSheet(
                                    title: Text("Download Photos"),
                                    message: Text("Select a photo to download."),
                                    buttons: [
                                        .default(Text("post")) {
                                            downloadImage(named: "post")
                                        },
                                        .default(Text("story")) {
                                            downloadImage(named: "story")
                                        },
                                        .cancel()
                                    ]
                                )
                            }

                            Spacer()
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitle("") // Empty title
            .navigationBarHidden(true) // Hide the default navigation bar
        }
        .alert(isPresented: $showDidSharePrompt) {
            Alert(
                title: Text("Did you ACTUALLY share the photo?"),
                message: Text("Be sure to Tag Us! @kingdom.conf"),
                primaryButton: .default(Text("YES")) {
                    showHonestyPrompt = true
                },
                secondaryButton: .cancel(Text("NO"))
            )
        }
        .alert(isPresented: $showHonestyPrompt) {
            Alert(
                title: Text("Jesus is watching, be honest"),
                primaryButton: .default(Text("YES")) {
                    showDiscountCode = true
                },
                secondaryButton: .cancel(Text("NO"))
            )
        }
        .alert(isPresented: $showDiscountCode) {
            Alert(
                title: Text("Your 15% Kingdom/25 Merch Discount Code"),
                message: Text("FIGHT.FIGHT.FIGHT"),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    func downloadImage(named imageName: String) {
        // Simulate download logic here
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showDidSharePrompt = true
        }
    }
}

#Preview {
    ShareAndEarnView()
}
