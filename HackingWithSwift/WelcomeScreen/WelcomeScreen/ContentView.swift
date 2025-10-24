//
//  ContentView.swift
//  WelcomeScreen
//
//  Created by Thomas Cowern on 10/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var features: [Feature] = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Welcome to \(Text("AwesomeApp").foregroundColor(.accentColor))")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle.bold())
                
                ForEach(features) { feature in
                    HStack {
                        Image(systemName: feature.image)
                            .frame(width: 44)
                            .font(.title)
                            .foregroundColor(.blue)
                            .accessibilityHidden(true)
                        
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.headline)
                            
                            Text(feature.description)
                                .foregroundColor(.secondary)
                        }
                        .accessibilityElement(children: .combine)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }   //: End of ForEach
            }
            .padding()
            .onAppear {
                features = loadJSONData(filename: "features") ?? []
            }
        }
        
        VStack {
            Text("Any important small print here.")
                .font(.footnote)
                .foregroundColor(.secondary)

            Button("Continue", action: close)
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
    }
    
    func loadJSONData(filename: String) -> [Feature]? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("JSON file not found: \(filename).json")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Feature].self, from: data)
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
    
    func close() {
        presentationMode.wrappedValue.dismiss()
    }

}

#Preview {
    ContentView()
        .accentColor(Color(red: 0.9, green: 0, blue: 0, opacity: 1))
}
