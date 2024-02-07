//
//  DashboardTabPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 23/01/24.
//

import SwiftUI

struct CardModel {
    let imageName: String
    let title: String
}

struct DashboardTabPage: View {
    @State var showSheet : Bool = false
    
    @State private var showingAlert = false
    @State private var selectedIndex: Int = 0
    
    @ObservedObject var dashboardDateViewModel: DashboardDateViewModel = DashboardDateViewModel();
    
    @State var selectedTab:Int = 2;
    
    @State var isWorkoutToday : Bool = false
    
    @State var workout: WorkoutModel = WorkoutModel(date: Date(), notes: "", exercises: [])
    
    var body: some View {
        NavigationStack {
            VStack{
                TabView(selection: $selectedTab){
                    DateLoop(selectedDate: Calendar.current.date(byAdding: .weekOfYear, value: -2, to: Date())!)
                        .tabItem {
                            Image(systemName: "globe")
                            Text("Browse")
                        }
                        .tag(0)
                    
                    DateLoop(selectedDate: Calendar.current.date(byAdding: .weekOfYear, value: -1, to: Date())!)
                        .tabItem {
                            Image(systemName: "globe")
                            Text("Browse")
                        }
                        .tag(1)
                    
                    DateLoop(selectedDate: Date())
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag(2)
                    
                    DateLoop(selectedDate: Calendar.current.date(byAdding: .weekOfYear, value: 1, to: Date())!)
                        .tabItem {
                            Image(systemName: "globe")
                            Text("Browse")
                        }
                        .tag(3)
                    
                    DateLoop(selectedDate: Calendar.current.date(byAdding: .weekOfYear, value: 2, to: Date())!)
                        .tabItem {
                            Image(systemName: "globe")
                            Text("Browse")
                        }
                        .tag(4)
                    
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 80)
                VStack {
                    if(workout.exercises.count > 0 ) {
                        List {
                            NavigationLink(destination: WorkoutPage(workout: $workout)) {
                                VStack {
                                    Text("Exercises")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    HStack(spacing: 0) {
                                        ForEach(Array(workout.exercises.enumerated()), id: \.offset) { index, exercise in
                                            Text(exercise.headline).font(.caption)
                                            if index != workout.exercises.count-1 {
                                                Text(", ").font(.caption)
                                            }
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
                
                Spacer()
                VStack {
                    NavigationLink(destination: WorkoutPage(workout: $workout)) {
                        Text("Start workout")
                            .font(.headline)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .frame(maxWidth: .infinity)
                            .cornerRadius(20)
                        
                    }.buttonStyle(BorderedProminentButtonStyle())
                    
                }
                .padding()
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

struct CardView: View {
    let card: CardModel
    
    var body: some View {
        VStack {
            Image(card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Text(card.title)
                .font(.title)
                .foregroundColor(.black)
        }
    }
}

struct DateLoop: View {
    @State private var showingAlert = false
    @State private var selectedIndex: Int = 0
    
    @ObservedObject var dashboardDateViewModel: DashboardDateViewModel = DashboardDateViewModel();
    
    init(selectedDate: Date) {
        self.dashboardDateViewModel.selectedDate = selectedDate
    }
    
    var body: some View {
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
            //ExcercisePage()
        }.navigationTitle("Start Workout");
    }
}

struct TodayWorkoutList: View {
    var body: some View {
        VStack {
                List {
                    ForEach(0..<10) {index in
                        NavigationLink(destination: StartWorkoutScreen()) {
                            HStack {
                                Text("Bench press")
                                Spacer()
                                Text("4 sets")
                            }
                        }
                    }
                }
                .listStyle(SidebarListStyle())
        }
    }
}


#Preview {
    DashboardTabPage()
}
