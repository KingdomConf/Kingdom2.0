

import SwiftUI

struct BreakoutsView: View {
    @State private var selectedSpeaker: String? = nil // Keeps track of which speaker was clicked

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Black Header Section
                ZStack {
                    Color.black
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 130)

                    Image("breakouts25")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width * 1.9, maxHeight: 90)
                        .multilineTextAlignment(.center)
                }

                // Scrollable Content Section
                ZStack {
                    Color.black.ignoresSafeArea() // Black background for any gaps
                    Image("breakouts bkg")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    ScrollView {
                        VStack(spacing: 20) {
                            // Row 1
                            HStack(spacing: 20) {
                                Button(action: { selectedSpeaker = "Jordan Foster" }) {
                                    Image("b jordan")
                                        .resizable()
                                        .frame(width: 180.0, height: 180.0)
                                }

                                Button(action: { selectedSpeaker = "Cameron Evans" }) {
                                    Image("b cam")
                                        .resizable()
                                        .frame(width: 180.0, height: 180.0)
                                }
                            }

                            // Row 2
                            HStack(spacing: 20) {
                                Button(action: { selectedSpeaker = "Ali Kritzwiser" }) {
                                    Image("b ali")
                                        .resizable()
                                        .frame(width: 180.0, height: 180.0)
                                }

                                Button(action: { selectedSpeaker = "Pastor Tyler Woodruff" }) {
                                    Image("b tyler")
                                        .resizable()
                                        .frame(width: 180.0, height: 180.0)
                                }
                            }

                            // Row 3
                            HStack(spacing: 20) {
                                Button(action: { selectedSpeaker = "Pastor Levi Kritzwiser" }) {
                                    Image("b levi")
                                        .resizable()
                                        .frame(width: 180.0, height: 180.0)
                                        .position(x: 140, y: 98)
                                }
                            }

                            // Divider for Pastors/Leaders Only Section
                            Text("Pastor/Leaders Only Breakouts")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 248 / 255, green: 232 / 255, blue: 7 / 255))

                            // Row 4
                            HStack(spacing: 20) {
                                Button(action: { selectedSpeaker = "Pastor Todd Kritzwiser" }) {
                                    Image("b todd")
                                        .resizable()
                                        .frame(width: 180.0, height: 180.0)
                                }

                                Button(action: { selectedSpeaker = "Pastor Penny Baldwin" }) {
                                    Image("b penny")
                                        .resizable()
                                        .frame(width: 180.0, height: 180.0)
                                }
                            }
                        }
                        .padding(.top, 20) // Adjust padding for the entire content
                    }
                }
            }
            .navigationBarHidden(true)
            .overlay(
                // Pop-up overlay
                Group {
                    if let speaker = selectedSpeaker {
                        VStack {
                            Text(speaker)
                                .font(.title)
                                .bold()
                                .padding(.top)

                            ScrollView {
                                Text(description(for: speaker))
                                    .padding(.horizontal)
                                    .padding(.top, 5)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(nil)
                            }
                            .frame(height: 200)

                            Spacer()

                            HStack {
                                Button(action: { selectedSpeaker = nil }) {
                                    Text("Close")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 100)
                                        .background(Color.black)
                                        .cornerRadius(8)
                                }

                                Spacer().frame(width: 20)

                                Link(destination: URL(string: "https://www.kingdomconf.com")!) {
                                    Text("Sign-up")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 100)
                                        .background(Color.black)
                                        .cornerRadius(8)
                                }
                            }
                            .padding(.bottom)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.5)
                        .background(Color(red: 248 / 255, green: 232 / 255, blue: 7 / 255))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .shadow(radius: 10)
                    }
                }
            )
        }
    }

    func description(for speaker: String) -> String {
        switch speaker {
        case "Jordan Foster":
            return "The topic of Jordan’s breakout session will be available shortly! Once it’s up, you’ll have the opportunity to sign up for her session. Stay tuned—times and locations are still to be determined, but we promise it’ll be worth the wait!"
        case "Cameron Evans":
            return "The topic of Cameron’s breakout session will be available shortly! Once it’s up, you’ll have the opportunity to sign up for his session. Stay tuned—times and locations are still to be determined, but we promise it’ll be worth the wait!"
        case "Ali Kritzwiser":
            return "The topic of Ali’s breakout session will be available shortly! Once it’s up, you’ll have the opportunity to sign up for her session. Stay tuned—times and locations are still to be determined, but we promise it’ll be worth the wait!"
        case "Pastor Tyler Woodruff":
            return "The topic of Pastor Tyler’s breakout session will be available shortly! Once it’s up, you’ll have the opportunity to sign up for his session. Stay tuned—times and locations are still to be determined, but we promise it’ll be worth the wait!"
        case "Pastor Levi Kritzwiser":
            return "The topic of Pastor Levi’s breakout session will be available shortly! Once it’s up, you’ll have the opportunity to sign up for his session. Stay tuned—times and locations are still to be determined, but we promise it’ll be worth the wait!"
        case "Pastor Todd Kritzwiser":
            return "Pastor Todd’s breakout session is exclusively designed for pastors, youth leaders, and youth staff. This session will provide practical insights and strategies to effectively lead the next generation. Stay tuned for session times and locations—it’s a can’t-miss opportunity to grow as a leader!"
        case "Pastor Penny Baldwin":
            return "Pastor Penny’s breakout session is tailored specifically for pastors, youth leaders, and youth staff. She will share wisdom and actionable steps to strengthen leadership and spiritual guidance within your ministry. Details about times and locations are coming soon—don’t miss this impactful session!"
        default:
            return "Details for this breakout session will be available shortly!"
        }
    }
}

#Preview {
    BreakoutsView()
}
