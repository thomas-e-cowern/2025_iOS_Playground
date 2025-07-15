import SwiftUI

struct LoadingView: View {
  var body: some View {
    VStack(spacing: 20) {
      ProgressView()
        .scaleEffect(1.5)
      
      Text("Fetching Weather Data...")
        .font(.headline)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .foregroundStyle(.black)
  }
}
