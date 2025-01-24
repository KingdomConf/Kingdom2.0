



import SwiftUI

struct ContentView: View {
    @State private var showSplash = true // State to manage splash visibility
    @State private var showSocialIcons = false
    @State private var showMenu = false // State for hamburger menu

    var body: some View {
        NavigationView {
            ZStack {
                if showSplash {
                    // Splash Screen
                    Image("splash")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .transition(.opacity) // Optional: Adds a fade effect
                        .onAppear {
                            // Hide splash screen after 2.5 seconds
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                withAnimation {
                                    showSplash = false
                                }
                            }
                        }
                } else {
                    // Main Content
                    ZStack {
                        // Black Background Layer
                        Color.black
                            .ignoresSafeArea()

                        // Background Image
                        Image("app bkg")
                            .resizable()
                            .padding(.all)
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2) // Center the background
                            .ignoresSafeArea()

                        // Content
                        VStack(spacing: 0) {
                            // SPEAKERS Button
                            NavigationLink(destination: SpeakersView()) {
                                Image("speakers")
                                    .resizable()
                                    .frame(width: 175.0, height: 40.0)
                            }
                            .position(x: 65, y: 320)

                            // SCHEDULE Button
                            NavigationLink(destination: ScheduleView()) {
                                Image("schedule button")
                                    .resizable()
                                    .frame(width: 175, height: 40)
                            }
                            .position(x: 200, y: 210)

                            // COST Button
                            NavigationLink(destination: CostView()) {
                                Image("cost button")
                                    .resizable()
                                    .frame(width: 175, height: 40)
                            }
                            .position(x: 335, y: 98)

                            // FAQ Button
                            NavigationLink(destination: FAQView()) {
                                Image("FAQ")
                                    .resizable()
                                    .frame(width: 175, height: 40)
                            }
                            .position(x: 65, y: 20)

                            // BREAKOUTS Button
                            NavigationLink(destination: BreakoutsView()) {
                                Image("breakouts")
                                    .resizable()
                                    .frame(width: 175, height: 40)
                            }
                            .position(x: 200, y: -90)

                            // MAP Button
                            NavigationLink(destination: MapView()) {
                                Image("map")
                                    .resizable()
                                    .frame(width: 175, height: 40)
                            }
                            .position(x: 335, y: -202)

                            // Pre-orders Link
                            Link(destination: URL(string: "https://lccmilford.churchcenter.com/registrations")!) {
                                Image("preorders")
                                    .resizable()
                                    .frame(width: 410, height: 80)
                            }
                            .position(x: 202, y: 40)
                        }

                        // Floating Social Buttons
                        VStack {
                            Spacer()

                            HStack(alignment: .center) {
                                Spacer()

                                VStack(alignment: .trailing, spacing: 10) {
                                    if showSocialIcons {
                                        HStack(spacing: 10) {
                                            Link(destination: URL(string: "https://www.instagram.com/kingdom.conf/")!) {
                                                Image("iglink")
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                            }

                                            Link(destination: URL(string: "https://www.facebook.com/kingdom.conf/")!) {
                                                Image("fblink")
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                            }

                                            Link(destination: URL(string: "https://www.kingdomconf.com/")!) {
                                                Image("weblink")
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                            }

                                            Link(destination: URL(string: "https://www.youtube.com/@KingdomConference")!) {
                                                Image("ytlink")
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                            }
                                        }
                                        .transition(.move(edge: .trailing)) // Expand outward to the left
                                        .animation(.easeInOut, value: showSocialIcons)
                                    }

                                    Button(action: {
                                        withAnimation {
                                            showSocialIcons.toggle()
                                        }
                                    }) {
                                        Image("social link")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    }
                                }
                                .padding()
                            }
                            .padding(.trailing, -0) // Adjust position to the right
                            .padding(.bottom, 520) // Adjust position vertically
                        }

                        // Hamburger Menu Button
                        VStack {
                            HStack {
                                Spacer()

                                Button(action: {
                                    withAnimation {
                                        showMenu.toggle()
                                    }
                                }) {
                                    Image(systemName: "line.horizontal.3")
                                        .resizable()
                                        .frame(width: 30, height: 20)
                                        .foregroundColor(Color(red: 248 / 255, green: 232 / 255, blue: 7 / 255)) // Yellow color
                                        .padding()
                                        .background(Color.black)
                                        .clipShape(Circle())
                                }
                                .padding()
                            }
                            Spacer()
                        }

                        // Menu Content
                        if showMenu {
                            VStack(alignment: .leading, spacing: 20) {
                                NavigationLink(destination: ShareAndEarnView()) {
                                    Text("Share & Earn")
                                }
                                NavigationLink(destination: KingdomGramView()) {
                                    Text("KingdomGram")
                                }
                                NavigationLink(destination: DevotionalsPage()) {
                                                                   Text("Devos")
                                                               }
                            }
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color(red: 248 / 255, green: 232 / 255, blue: 7 / 255)) // Correct yellow
                            .foregroundColor(Color.black)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .transition(.move(edge: .trailing))
                            .animation(.easeInOut, value: showMenu)
                            .padding(.top, 50) // Adjust the top position of the menu
                        }
                    }
                    .navigationBarHidden(true) // Hide the navigation bar for a cleaner look
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
