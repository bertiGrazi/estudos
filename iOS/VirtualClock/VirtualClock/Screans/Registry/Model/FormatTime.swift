//
//  FormatTime.swift
//  VirtualClock
//
//  Created by Grazielli Berti on 23/02/22.
//

import Foundation

enum TypeData {
    case hour, dateAndHour
}

struct FormatTime {
    
    func getData(_ data: Date) -> String {
        let format = DateFormatter()
        format.timeZone = TimeZone(abbreviation: "GMT-3")
        format.dateFormat = "dd/MM/yyyy HH:mm"
        
        return format.string(from: data)
    }
    
    func getHour(_ data: Date) -> String {
        let format = DateFormatter()
        format.timeZone = TimeZone(abbreviation: "GMT-3")
        format.dateFormat = "HH:mm"
        
        return format.string(from: data)
    }
}
