//
//  ContentView.swift
//  FunctionAttributes
//
//  Created by Thomas Cowern on 3/12/25.
//

import SwiftUI

extension View  {
    @warn_unqualified_access
    func titleStyle() -> some View {
        self
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundStyle(.red)
        
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(Color.blue)
                .clipShape(.capsule)
                .titleStyle()
                .task {
                    await test_namesAreLoaded()
                }
        }
        .padding()
        
        
    }
    
    func example() {
        var albums = Set<String>()
        albums.insert("Bob Marley")
        albums.insert("Jimmy Buffett")
        
        let result = albums.insert("Jimmy Buffett")
        print(result.inserted)
        print(result.memberAfterInsert)
    }
    
    func test_namesAreLoaded() async {
        let sut = Band()
        
        let result = sut.loadData()
        await result.value
        await print(result.value)
        
        assert(sut.names.count == 4, "Calling loadData() should load four names.")
    }
}

#Preview {
    ContentView()
}

class Band {
    var names = [String]()
    
    @discardableResult
    func loadData() -> Task<Void, Never>  {
        Task {
            try? await Task.sleep(for: .seconds(3))
            names = ["Bill", "Mike", "Steven", "Reginald"]
        }
    }
}
