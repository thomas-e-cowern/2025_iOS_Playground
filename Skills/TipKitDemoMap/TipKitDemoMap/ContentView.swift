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
                    
                        .padding()
                        .offset(x: 0, y: 130)
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

#Preview {
    ContentView()
}
