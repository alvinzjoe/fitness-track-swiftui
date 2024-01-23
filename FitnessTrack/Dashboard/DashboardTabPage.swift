//
//  DashboardTabPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 23/01/24.
//

import SwiftUI

struct Dates: Identifiable {
    var id: String = UUID().uuidString
    var date: Date = Date()
    var day: String = ""
    var isActive: Bool = false;
    var isDidWorkout: Bool = false
}

struct DashboardTabPage: View {
    @State var showSheet : Bool = false
    
    private var calendar: Calendar {
        var calendar = Calendar.current
        calendar.firstWeekday = 2 // Set first weekday to Monday (1 is Sunday, 2 is Monday)
        return calendar
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d/M"
        return formatter
    }()
    
    @State private var showingAlert = false
    
    @State private var datesArray: [Dates] = []
    
    var body: some View {
        NavigationView(content: {
            VStack{
                HStack {
                    ForEach(0..<7) { index in
                        let date = self.date(for: index)
                        let day = self.day(for: date)
                        
                        VStack {
                            Circle()
                                .foregroundColor(Color.yellow)
                                .overlay {
                                    VStack {
                                        Text(day.prefix(2)).font(.caption2)
                                        Text(self.dateFormatter.string(from: date)).font(.caption2)
                                    }
                                }
                                .onTapGesture {
                                    showingAlert = true
                                }
                                .alert("\(self.dateFormatter.string(from: date))", isPresented: $showingAlert) {
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
            
            
        })
        
        
    }
    
    private func generateDate(){
        ForEach(0..<7) { index in
            let date = self.date(for: index)
            let day = self.day(for: date)
            
//            datesArray.append(Dates(date: date, day: day, isActive: false, isDidWorkout: false)
        }
    }
    
    private func date(for dayIndex: Int) -> Date {
        let currentDate = calendar.startOfDay(for: self.getMonday(myDate: Date()))
        return calendar.date(byAdding: .day, value: dayIndex, to: currentDate) ?? Date()
    }
    
    func getMonday(myDate: Date) -> Date {
        let cal = Calendar.current
        var comps = cal.dateComponents([.weekOfYear, .yearForWeekOfYear], from: myDate)
        comps.weekday = 2 // Monday
        let mondayInWeek = cal.date(from: comps)!
        return mondayInWeek
    }

    private func day(for date: Date) -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"
        return dayFormatter.string(from: date)
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
