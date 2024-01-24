//
//  ProfileTabPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 23/01/24.
//

import SwiftUI

struct ProfileTabView: View {
    var body: some View {
        NavigationView(content: {
            VStack {
                Circle()
                    .stroke(.gray, lineWidth: 2)
                    .frame(width: 100)
                    .foregroundStyle(.white)
                    .overlay {
                        Image(systemName: "person")
                    }
                Text("Profile")
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle("My profile")
        })
    }
}

#Preview {
    ProfileTabView()
}
