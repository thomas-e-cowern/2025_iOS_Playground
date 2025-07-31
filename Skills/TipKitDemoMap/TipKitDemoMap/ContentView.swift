//
//  ContentView.swift
//  TipKitDemoMap
//
//  Created by Thomas Cowern on 7/31/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    private let images :[String] = ["carrousel.1", "carrousel.2", "carrousel.3", "carrousel.4"]
    
    @State private var currentIndex:Int = 0
    @GestureState private var dragOffset:CGFloat = 0
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Map(coordinateRegion: $region)
                        .ignoresSafeArea()
                }
                .overlay (
                    getCarouselImage()
                    , alignment: .bottom)
                
                .overlay(
                    getInfoButton()
                    ,alignment: .topTrailing )
                
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            let threshold:CGFloat = 50
                            if value.translation.width > threshold {
                                withAnimation{
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            }
                            else if value.translation.width < -threshold {
                                withAnimation {
                                    currentIndex = min(images.count - 1,
                                                       currentIndex + 1)
                                }
                            }
                        })
                )
            }
            .onAppear{
                
            }
        }
    }
        
        func getCarouselImage() -> some View {
            ForEach(0..<images.count, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(25)
                    .opacity(currentIndex == index ? 1.0 : 0.5)
                    .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                    .offset(x: CGFloat(index - currentIndex)*150 + dragOffset, y:0)
                    .onTapGesture {
                        
                    }
            }
        }
        
        func getTitleSubtitle() -> some View {
            VStack(alignment: .center, spacing: 10) {
                Text("Trick-or-treat 🎃")
                    .font(.title3)
                    .foregroundStyle(.primary)
                
                Text("We wish you not to face the biggest designer's nightmares in reality and that clients treat you well!")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        
        func getInfoButton() -> some View {
            Button {
                print("Button was tapped")
                
            } label: {
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)

            }
            .padding()
            
        }
}

#Preview {
    ContentView()
}
