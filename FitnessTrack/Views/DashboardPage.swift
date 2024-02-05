//
//  DashboardPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 18/01/24.
//

import SwiftUI

struct DashboardPage: View {
    @State var indexTab : Int = 0;
    
    var body: some View {
        
            TabView(selection: $indexTab) {
                    DashboardTabPage()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Dashboard")
                        }
                        .tag(0)
                    
                    ProfileTabView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag(1)
            }
            .tabViewStyle(DefaultTabViewStyle())
        }
        
}

#Preview {
    DashboardPage()
}
