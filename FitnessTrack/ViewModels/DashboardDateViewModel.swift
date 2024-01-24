//
//  DashboardDateViewModel.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 24/01/24.
//

import Foundation

class DashboardDateViewModel: ObservableObject {
    @Published var selectedDate: Date = Date()
    
    var calendar: Calendar {
        var calendar = Calendar.current
        calendar.firstWeekday = 2 // Set first weekday to Monday (1 is Sunday, 2 is Monday)
        return calendar
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d/M"
        return formatter
    }()
    
    func date(for dayIndex: Int) -> Date {
//        let selectedDate = formatToday(string: "10/01/2024")
        let currentDate = calendar.startOfDay(for: self.getMonday(myDate: selectedDate))
        return calendar.date(byAdding: .day, value: dayIndex, to: currentDate) ?? Date()
    }
    
    func getMonday(myDate: Date) -> Date {
        let cal = Calendar.current
        var comps = cal.dateComponents([.weekOfYear, .yearForWeekOfYear], from: myDate)
        comps.weekday = 2 // Monday
        let mondayInWeek = cal.date(from: comps)!
        return mondayInWeek
    }

    func day(for date: Date) -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"
        return dayFormatter.string(from: date)
    }
    
    func formatToday(string: String = "01/02/1995") -> Date {

        // Create Date Formatter
        let dateFormatter = DateFormatter();

        // Set Date Format
        dateFormatter.dateFormat = "dd/MM/yy";

        // Convert String to Date
        return dateFormatter.date(from: string) ?? Date();
    }
}
