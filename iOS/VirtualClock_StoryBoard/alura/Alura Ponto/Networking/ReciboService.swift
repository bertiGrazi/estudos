//
//  ReciboService.swift
//  Alura Ponto
//
//  Created by Grazielli Berti on 01/03/22.
//

import Foundation

//Responsavel para criar as requisições que será salva
class ReciboService {
    func post(_ recibo: Recibo) {
        let baseURL = "http://localhost:8080/"
        let path = "recibos"
        
        //Copiar os parametros
        let parametros: [String: Any] = [
            "data": FormatadorDeData().getData(recibo.data),
            "status": recibo.status,
            "localizacao": [
                "latitude": recibo.latitude,
                "longitude": recibo.longitude,
            ]
        ]
        
        //Transformar em Data = converter essa requisiça2o
        guard let body = try? JSONSerialization.data(withJSONObject: parametros, options: []) else { return }
        
        //Transformando tudo em uma url
        guard let url = URL(string: baseURL+path) else { return }
        
        //Passando a URL
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "POST"
        requisicao.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //Configurar o que vamos enviar para o parâmetro
        requisicao.httpBody = body
        
        //dataTask = é o que de fato faz a requisição
        URLSession.shared.dataTask(with: requisicao) { data, resposta, erro in
            if let resposta = resposta {
                print(resposta)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    
                } catch {
                    print(erro)
                }
            }
        }.resume() //para executar a requisição
    }
}
