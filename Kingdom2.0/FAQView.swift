


import SwiftUI

struct FAQView: View {
    @State private var expandedIndex: Int? = nil  // Tracks which FAQ is expanded

    // FAQ data
    let faqData: [(question: String, answer: String)] = [
        ("★ What is Kingdom/25? ★", "Kingdom/25 is a high-energy youth conference where students come together to grow in their faith, build community, and experience God in a powerful way."),
        ("★ Who can attend Kingdom/25? ★", "Kingdom/25 is for students 6th–12th grade. Youth Pastor/Leader & adult chaperones are also encouraged to attend with their groups."),
        ("★ Should I sign up as an individual? ★", "No. We ask that you sign up as a group. Individual registrations should be with your church/youth group."),
        ("★ How do I register my group for Kingdom/25? ★", "Group leaders can register their group online through our official Kingdom/25 website. Once registered, you’ll receive a confirmation email with all the necessary details."),
        ("★ Is lodging provided for groups? ★", "No, lodging is not provided. Groups are responsible for arranging their own accommodations. We will provide a list of nearby hotels offering group rates."),
        ("★ Are meals included in the registration fee? ★", "Meals are not included in the registration fee. However, we will have snacks available for purchase. *PLEASE NOTE: Food is NOT permited in the sanctuary."),
        ("★ What should I bring to Kingdom? ★", "Bible, notebook, pen, comfortable clothing."),
        ("★ Will there be merch for sale? ★", "Yes! Exclusive Kingdom/25 merchandise will be available!"),
        ("★ What safety measures are in place? ★", "We prioritize safety with a fully trained security team on-site. No bags bigger than a hand bag are permited. Hand bags  will be checked by our security team upon entry. Group Pastors/Leaders are responsible for supervising their students throughout the event."),
        ("★ Can I volunteer at Kingdom/25? ★", "Absolutely! We welcome volunteers to help with setup, tear-down, registration, and other areas. View the Volunteer FAQ & Guidelines for more information.")
    ]

    var body: some View {
        ZStack {
            // Background Image
            Color(.black)
                .ignoresSafeArea()
        
         VStack(spacing: -650) {  // Adjusted spacing
                // Top Banner Image
                Image("faqtop")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                    .position(x: 200, y: 30)

                
                ScrollView {
                    VStack(alignment: .center, spacing: 8) {  // Adjusted spacing
                        ForEach(faqData.indices, id: \.self) { index in
                            VStack(alignment: .center, spacing: 5) {
                                // Question Button
                                Button(action: {
                                    withAnimation {
                                        expandedIndex = expandedIndex == index ? nil : index
                                    }
                                }) {
                                    Text(faqData[index].question)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color(red: 248/255, green: 242/255, blue: 7/255))
                                        .cornerRadius(8)
                                }
                                
                                // Answer (Dropdown)
                                if expandedIndex == index {
                                    Text(faqData[index].answer)
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.black)
                                        .cornerRadius(8)
                                        .transition(.opacity)
                                }
                            }
                            .padding(.horizontal, 0)  // Adjusted padding
                        }
                        
                        // Volunteer Buttons Section
                        VStack(spacing: 1) {
                            HStack(spacing: 10) {
                                // Volunteer FAQ Button
                                Link(destination: URL(string: "https://42fa72af-129c-4fcc-9a5b-eea191bc44b2.filesusr.com/ugd/321646_aa36ad3f20af4686806396d0fc5f7f23.pdf")!) {
                                    HStack {
                                        Text("★")
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text("Volunteer FAQ")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                        Text("★")
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(red: 248/255, green: 242/255, blue: 7/255))
                                    .cornerRadius(8)
                                }

                                // Volunteer Guidelines Button
                                Link(destination: URL(string: "https://www.kingdomconf.com/_files/ugd/321646_7d775c03b2e94b70b0547ab5da375a31.pdf")!) {
                                    HStack {
                                        Text("★")
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text("Volunteer Guidelines")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                        Text("★")
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(red: 248/255, green: 242/255, blue: 7/255))
                                    .cornerRadius(8)
                                }
                            }
                            .frame(width: 375, height: 140)
                        }
                        }
                            // Volunteer Agreement Button
                            Link(destination: URL(string: "https://www.kingdomconf.com/volunteeragreement")!) {
                                Text("★ Volunteer Agreement ★")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(red: 248/255, green: 242/255, blue: 7/255))
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.top, 2)  // Space between FAQ and buttons
                        .padding(.horizontal, 5)
                    }
                }
            }
        }
    


#Preview {
    FAQView()
}
