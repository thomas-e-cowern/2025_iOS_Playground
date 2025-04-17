//
//  ContentView.swift
//  ParsingDifficultJSON
//
//  Created by Thomas Cowern on 4/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var object: Any?
    
    var body: some View {
        VStack {
            Text("Nope")
        }
        .padding()
        .task {
            decodeUnknownJSON()
        }
    }
    
    func decodeUnknownJSON() {
//        guard let url = Bundle.main.url(forResource: "JsonData", withExtension: "json") else {
//            fatalError("Failed to load json data from file")
//        }
//        
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load data from bundle")
//        }
        
        object = try? JSON(string: json)
        for item in object {
            print(item["title"].string)
        }
    }
}

let json = """
[
    {
        "name": "Taylor Swift",
        "company": "Taytay Inc",
        "age": 26,
        "address": {
            "street": "555 Taylor Swift Avenue",
            "city": "Nashville",
            "state": "Tennessee",
            "gps": {
                "lat": 36.1868667,
                "lon": -87.0661223
            }
        }
    },
    {
        "title": "1989",
        "type": "studio",
        "year": "2014",
        "singles": 7
    },
    {
        "title": "Shake it Off",
        "awards": 10,
        "hasVideo": true
    }
]
"""


#Preview {
    ContentView()
}
