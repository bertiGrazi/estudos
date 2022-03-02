//
//  ReciboService.swift
//  Alura Ponto
//
//  Created by Grazielli Berti on 01/03/22.
//

import Foundation
import Alamofire

//Responsavel para criar as requisições que será salva
class ReciboService {
    
    func get() {
        AF.request("http://localhost:8080/recibos", method: .get, headers: ["Accept": "application/json"]).responseJSON { resposta in
            switch resposta.result {
            case .success(let json):
                //Transformar o objetos que estamos retornando em recibo
                //temos acesso a lista que o servidor devolve
                var recibos: [Recibo] = []
                if let listaDeRecibos = json as? [[String: Any]] {
                    //percorrer a lista
                    for reciboDict in listaDeRecibos {
                        if let novoRecibo = Recibo.serializa(reciboDict) {
                            recibos.append(novoRecibo)
                        }
                    }
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    func post(_ recibo: Recibo, completion: @escaping(_ salvo:Bool) -> Void) {
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
        URLSession.shared.dataTask(with: requisicao) { data, resposta, error in
            if error == nil {
                completion(true)
                
                return
            }
            
            completion(false)
        }.resume() //para executar a requisição
    }
}
