

import SwiftUI

struct MapView: View {
    @State private var selectedImage: String? = nil
    @State private var isFullScreenPresented = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Black Banner at the Top
                ZStack {
                    Color.black
                        .ignoresSafeArea(edges: .top) // Black background spanning the full width
                        .frame(height: 130)

                    Image("building25")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width * 1.0, maxHeight: 90)
                        .multilineTextAlignment(.center)
                }

                // Scrollable Content Area
                ScrollView {
                    ZStack {
                        // Black Background Behind Image
                        Color.black
                            .ignoresSafeArea()

                        // Background Image
                        Image("map bkg")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()

                        VStack(spacing: 20) {
                            // Main Floor Map Button
                            Button(action: {
                                selectedImage = "main floor"
                                isFullScreenPresented = true
                            }) {
                                Image("main floor")
                                    .resizable()
                                    .frame(width: 400, height: 250)
                            }

                            // Second Floor Map Button
                            Button(action: {
                                selectedImage = "second floor"
                                isFullScreenPresented = true
                            }) {
                                Image("second floor")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 400, height: 250)
                            }

                            // Nearby Food/Hotels Button
                            Button(action: {
                                selectedImage = "area map" // Updated to use the image "area map"
                                isFullScreenPresented = true
                            }) {
                                Text("Nearby Food/Hotels")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width * 0.85)
                                    .background(Color(red: 242 / 255, green: 234 / 255, blue: 7 / 255))
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                            }

                            // Directions Button
                            Link(destination: URL(string: "http://maps.apple.com/?address=701+Chamber+Drive,Milford,Ohio,45150")!) {
                                Text("Get Directions to Life Change Church")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width * 0.85)
                                    .background(Color(red: 242 / 255, green: 234 / 255, blue: 7 / 255))
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                            }
                        }
                        .padding(.top, 20)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true) // Ensure navigation bar doesn’t interfere
            .background(Color.black) // Ensure consistent black background
        }
        // Full-Screen Image Presentation
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            ZStack {
                // Background to dim the screen
                Color.black.opacity(0.95).ignoresSafeArea()

                if let imageName = selectedImage {
                    ZoomableImage(imageName: imageName) // New zoomable image view
                } else {
                    // Handle cases where the image is nil
                    Text("Image not found")
                        .foregroundColor(.white)
                        .font(.headline)
                }

                // Close (X) Button
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isFullScreenPresented = false
                            selectedImage = nil // Clear selected image
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 35))
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

// Custom Zoomable Image View
struct ZoomableImage: View {
    let imageName: String
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero

    var body: some View {
        GeometryReader { geometry in
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .scaleEffect(scale)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = CGSize(width: value.translation.width, height: value.translation.height)
                        }
                        .onEnded { _ in
                            withAnimation {
                                offset = .zero
                            }
                        }
                )
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = value.magnitude
                        }
                        .onEnded { _ in
                            withAnimation {
                                scale = max(1.0, scale) // Prevent scaling below original size
                            }
                        }
                )
        }
    }
}

#Preview {
    MapView()
}
