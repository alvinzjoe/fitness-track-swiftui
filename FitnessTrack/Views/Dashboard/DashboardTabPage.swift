//
//  DashboardTabPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 23/01/24.
//

import SwiftUI

struct DashboardTabPage: View {
    @State var showSheet : Bool = false
    
    @State private var showingAlert = false
    @State private var selectedIndex: Int = 0
    
    @ObservedObject var dashboardDateViewModel: DashboardDateViewModel = DashboardDateViewModel();
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    ForEach(0..<7) { index in
                        let date = dashboardDateViewModel.date(for: index)
                        let day = dashboardDateViewModel.day(for: date)
                        
                        VStack {
                            Circle()
                                .foregroundColor(Color.yellow)
                                .overlay {
                                    VStack {
                                        Text(day.prefix(2)).font(.caption2)
                                        Text(dashboardDateViewModel.dateFormatter.string(from: date)).font(.caption2)
                                    }
                                }
                                .onTapGesture {
                                    showingAlert = true
                                    selectedIndex = index
                                    
                                }
                                .alert("\(dashboardDateViewModel.date(for: selectedIndex)) \(dashboardDateViewModel.formatToday())", isPresented: $showingAlert) {
                                    Button("OK", role: .cancel) { }
                                }
                        }
                    }
                }.padding()
                
                NavigationLink("Start Workout") {
                    StartWorkoutScreen()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                NavigationLink("Exercise List") {
                    WorkoutPage()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .onAppear {
                dashboardDateViewModel.selectedDate = dashboardDateViewModel.formatToday(string: "10/01/2024")
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle("Dashboard")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "calendar")
                        .onTapGesture {
                            showSheet.toggle()
                        }
                }
            })
            .sheet(isPresented: $showSheet, content: {
                CalendarSelectorSheet()
            })
            
            
        }
    }
}

struct CalendarSelectorSheet: View {
    @Environment(\.presentationMode) var presentationMode;
    var body: some View {
        Button("Close") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct StartWorkoutScreen: View {
    var body: some View {
        VStack {
            ExcercisePage()
        }.navigationTitle("Start Workout");
    }
}

struct SetsModel: Identifiable {
    var id: String = UUID().uuidString
    var reps: String
    var weight: String
}


#Preview {
    DashboardTabPage()
}
