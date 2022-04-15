//
//  ReceiptsViewModel.swift
//  VirtualClock
//
//  Created by Grazielli Berti on 01/03/22.
//

import Foundation

class ReceiptsViewModel {
    var businessModel: ReceiptsProtocol = ReceiptsBusinessModel()
    
    func fetchRegistryList() {
        businessModel.fetchRegistryList()
    }
}
