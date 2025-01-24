

import SwiftUI

struct SpeakersView: View {
    @State private var selectedSpeaker: String? = nil // Keeps track of which speaker was clicked

    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("Punch")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    // Black Header Section
                    ZStack {
                        Color.black
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 130)

                        Image("speakers25")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: UIScreen.main.bounds.width * 1.9, maxHeight: 90)
                            .multilineTextAlignment(.center)
                    }

                    // Scrollable Content Section
                    ScrollView {
                        VStack(spacing: -10) { // Adjust spacing here to control row spacing
                            // Row 1
                            ZStack {
                                Button(action: { selectedSpeaker = "Keenan Clark" }) {
                                    Image("m speaker 1")
                                        .resizable()
                                        .frame(width: 410, height: 220)
                                }
                                HStack(spacing: 0) {
                                    Link(destination: URL(string: "https://www.instagram.com/keenanclark_/")!) {
                                        Image("IG")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            
                                        
                                    }
                                Link(destination: URL(string: "https://www.facebook.com/KeenanClarkOfficial")!) {
                                    Image("FB")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                   
                                           
                                    }
                                    Link(destination: URL(string: "https://www.keenanclark.org")!) {
                                        Image("WP")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        
                                    }
                                }
                                .position(x: 335, y: 180) // Same position as your original code
                            }

                            // Row 2
                            ZStack {
                                Button(action: { selectedSpeaker = "Speaker 2" }) {
                                    Image("m speaker 2")
                                        .resizable()
                                        .frame(width: 410, height: 220)
                                }
                                HStack(spacing: -0) {
                                    Link(destination: URL(string: "https://www.instagram.com/kingdom.conf/")!) {
                                        Image("IG")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                Link(destination: URL(string: "https://www.facebook.com/kingdomconf")!) {
                                    Image("FB")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    
                                    
                                    }
                                    Link(destination: URL(string: "https://www.kingdomconf.com")!) {
                                        Image("WP")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                        
                                    }
                                }
                                .position(x: 115, y: 180) // Same position as your original code
                            }

                            // Row 3
                            ZStack {
                                VStack(spacing: -10) { // Adjust spacing here to control row spacing
                                    // Row 2
                                Button(action: { selectedSpeaker = "Speaker 3" }) {
                                    Image("m speaker 3")
                                        .resizable()
                                        .frame(width: 410, height: 220)
                                }
                                HStack(spacing: -0) {
                                    Link(destination: URL(string: "https://www.facebook.com/kingdomconf")!) {
                                        Image("FB")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .position(x:335, y: -25)
                                    }
                                    Link(destination: URL(string: "https://www.instagram.com/kingdom.conf/")!) {
                                        Image("IG")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .position(x: 155, y: -25)
                                    }
                                    Link(destination: URL(string: "https://www.kingdomconf.com")!) {
                                        Image("WP")
                                            .resizable()
                                    }        .frame(width: 30, height: 30)
                                        .position(x:75, y: -25)
                                    }
                                    
                                }
                                .position(x: 220, y: 120) // Same position as your original code
                            }

                            // Row 4
                            ZStack {
                                Button(action: { selectedSpeaker = "Speaker 4" }) {
                                    Image("m speaker 2")
                                        .resizable()
                                        .frame(width: 410, height: 220)
                                }
                                HStack(spacing: -0) {
                                    Link(destination: URL(string: "https://www.facebook.com/kingdomconf")!) {
                                        Image("FB")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                    Link(destination: URL(string: "https://www.instagram.com/kingdom.conf/")!) {
                                        Image("IG")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                    Link(destination: URL(string: "https://www.kingdomconf.com")!) {
                                        Image("WP")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                }
                                .position(x: 110, y: 180) // Same position as your original code
                            }
                        }
                        .padding(.top, 10) // Adjust overall vertical offset for all rows
                    }
                }

                // Popup Overlay
                if let speaker = selectedSpeaker {
                    ZStack {
                        Color.black.opacity(0.7)
                            .ignoresSafeArea()

                        VStack {
                            Text(speaker)
                                .font(.title)
                                .bold()
                                .padding(.top)

                            ScrollView {
                                Text(description(for: speaker))
                                    .padding(.horizontal)
                                    .padding(.top, 0)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(height: 320)

                            Spacer()

                            HStack {
                                Button(action: { selectedSpeaker = nil }) {
                                    Text("Close")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 250)
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
            }
            .navigationBarHidden(true)
        }
    }

    func description(for speaker: String) -> String {
        switch speaker {
        case "Keenan Clark":
            return "Keenan Clark is a passionate husband, father, pastor, creator, and evangelist who has pledged his life to sharing the uncompromising message of the Gospel. Keenan’s favorite travel partners are his wife, Beth, and son, August. Keenan has been a PK since day one, which contributed to his love for the local church. He faithfully served at the church his parents founded, Celebration Church San Angelo, for 15 years where he launched and led their vibrant Young Adult ministry for 8 years. In 2023, the Lord spoke to move their family and ministry headquarters to Franklin, TN. After prophetic confirmation after confirmation, an extensive time of prayer and fasting, and submitting it to their leadership, it was clear the Lord was calling them. They are excited to put their best “yes” forward come January 2024. Keenan will continue to love his family, serve the local church, travel and evangelize, and utilize social media to advance the Kingdom of Heaven."
        case "Speaker 2":
            return "We have been talking with multiple speakers to come speak at Kingdom/25. Once we have a speaker confirmed will will announce it here! Stay tuned!"
        case "Speaker 3":
            return "We have been talking with multiple speakers to come speak at Kingdom/25. Once we have a speaker confirmed will will announce it here! Stay tuned!"
        case "Speaker 4":
            return "We have been talking with multiple speakers to come speak at Kingdom/25. Once we have a speaker confirmed will will announce it here! Stay tuned!"
        default:
            return ""
        }
    }
}

#Preview {
    SpeakersView()
}
