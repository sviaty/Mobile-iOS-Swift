//
//  ViewController.swift
//  DateFormat
//
//  Created by Dufour Sviatoslav on 14/03/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let date = Date()
    
    var min: TimeInterval = 60
    var heure: TimeInterval = 60 * 60
    var jour: TimeInterval = 60 * 60 * 24
    
    
    @IBOutlet weak var dateStringLbl: UILabel!
    @IBOutlet weak var timeIntervalLbl: UILabel!
    @IBOutlet weak var calendarLbl: UILabel!
    @IBOutlet weak var ilyaLbl: UILabel!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    let format = "EEEE dd MMMM yyyy - HH:mm:ss - zzzz"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateActuelle()
        intervalDate()
        
        let dateFormat = formatStringToDate("mer., 12 sept 2014 14:12:00")
        if let d = dateFormat {
             print("dateFormat : \(d)")
        }
    
        print("calendarStr : \(calendarStr(self.date))")
        
        timeDifference(Date(timeIntervalSinceNow: -jour))
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let date  = sender.date
        // dateStringLbl.text = date.toString()
        dateStringLbl.text = date.formatStr(self.format)
        timeIntervalLbl.text = date.timeStamp()
        calendarLbl.text = date.whatsDay()
        ilyaLbl.text = date.components()
    }
    
   

    func dateActuelle() {
        print("date :\(self.date)")
    }
    
    func intervalDate() {
        
        
        let dateInterval = Date(timeIntervalSinceNow: self.jour)
        print("dateInterval : \(dateInterval)")
        
        let dateHier = Date(timeIntervalSinceNow: -self.jour)
        print("dateHier : \(dateHier)")
        print("formatDate: \(formatDateToString(dateHier))")
        
        let dateAutre = Date(timeIntervalSinceReferenceDate: self.jour)
        print("dateAutre : \(dateAutre)")
    }
    
    func formatDateToString(_ date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = DateFormatter.Style.full // .none .short .medium .long .full
        dateFormater.timeStyle = .medium // .none .short .medium .long .full
        dateFormater.locale = Locale(identifier: "fr_FR")
        return dateFormater.string(from: date)
    }
    
    func formatStringToDate(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss"
        formatter.locale = Locale(identifier: "fr_FR")
        if let date = formatter.date(from: string){
            return date
        }
        return nil
    }
    
    func calendarStr(_ date: Date) -> String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date){
            return "Today"
        }
        if calendar.isDateInYesterday(date){
            return "Hier"
        }
        if calendar.isDateInTomorrow(date){
            return "Tomorrow"
        }
        if calendar.isDateInWeekend(date){
            return "Week end"
        }
        return ""
    }
    
    func timeDifference(_ date: Date) {
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.month, .day, .hour, .minute], from: date, to: Date())
        
        print("mois : \(String(describing: components.month))")
        print("jours : \(String(describing: components.day))")
        print("heures : \(String(describing: components.hour))")
        print("minutes : \(String(describing: components.minute))")
    }
}


extension Date {
    func toString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = DateFormatter.Style.full // .none .short .medium .long .full
        dateFormater.timeStyle = .medium // .none .short .medium .long .full
        dateFormater.locale = Locale(identifier: "fr_FR")
        return dateFormater.string(from: self)
    }
    
    func formatStr(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: self)
    }
    
    func timeStamp() -> String {
        let temps = self.timeIntervalSinceNow
        return String(format: "%.2f", temps)
    }
    
    func whatsDay() -> String {
        var str = ""
        let cal = Calendar.current
        if cal.isDateInToday(self) {
            str += "Aujourd'hui "
        }
        
        if cal.isDateInYesterday(self) {
            str += "Hier"
        }
        
        if cal.isDateInTomorrow(self){
            str += "Demain"
        }
        return str
    }
    
    func components() -> String {
        let cal = Calendar.current
        let components = cal.dateComponents([.month, .day, .hour, .minute], from: self)
        print(components)
        let mois = components.month ?? 0
        let jours = components.day ?? 0
        let heure = components.hour ?? 0
        let min = components.minute ?? 0
        
        return "Temps écoulé mois: \(mois), jours: \(jours), heure: \(heure), min: \(min)"
        
    }
}

