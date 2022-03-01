//
//  ReceiptsBusinessModel.swift
//  VirtualClock
//
//  Created by Grazielli Berti on 01/03/22.
//

import Foundation

class ReceiptsBusinessModel: ReceiptsProtocol {
    
    func fetchRegistryList() -> [Receipts] {
        return [
            Receipts(status: true, registry: "REGISTRO DE PONTO DO TRABALHADOR", data: "12/10/2021 - ALURA PONTO"),
            Receipts(status: true, registry: "REGISTRO DE PONTO DO TRABALHADOR", data: "12/10/2021 - ALURA PONTO"),
            Receipts(status: true, registry: "REGISTRO DE PONTO DO TRABALHADOR", data: "12/10/2021 - ALURA PONTO"),
            Receipts(status: false, registry: "REGISTRO DE PONTO DO TRABALHADOR", data: "12/10/2021 - ALURA PONTO"),
            Receipts(status: true, registry: "REGISTRO DE PONTO DO TRABALHADOR", data: "12/10/2021 - ALURA PONTO"),
            Receipts(status: false, registry: "REGISTRO DE PONTO DO TRABALHADOR", data: "12/10/2021 - ALURA PONTO"),
        ]
    }
}
