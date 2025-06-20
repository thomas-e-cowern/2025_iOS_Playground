//
//  ActivityCard.swift
//  HealthKitPlayground
//
//  Created by Thomas Cowern on 6/20/25.
//

import SwiftUI

struct ActivityCard: View {
    
    @State var activity: Activity
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(activity.title)
                            .font(.system(size: 16))
                        
                        Text(activity.subtitle)
                            .font(.system(size: 12))
                            .foregroundStyle(Color.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: activity.imageName)
                        .foregroundStyle(Color.green)
                }
                
                Text(activity.amount)
                    .font(.system(size: 24))
            }
            .padding()
        }
    }
}

#Preview {
    ActivityCard(activity: Activity.example[0])
}
