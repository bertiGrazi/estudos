//
//  Receipts.swift
//  VirtualClock
//
//  Created by Grazielli Berti on 24/02/22.
//

import Foundation
import UIKit

class Receipts: NSObject {
    
    var status: Bool
    var registry: String
    var data: String
    
    init(status: Bool, registry: String, data: String) {
        self.status = status
        self.registry = registry
        self.data = data
    }
}
