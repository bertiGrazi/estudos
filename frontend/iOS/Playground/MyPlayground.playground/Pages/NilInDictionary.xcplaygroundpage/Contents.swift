import UIKit

var dicionario: [Int: String?] = [0: "Caio", 1: "Fekipe", 2: nil]

////acessando o item 0 e atribuindo o valor nil
dicionario[0] = nil //ESTAMOS REMOVENDO ESSE ITEM DO NOSSO DICIONÁRIO
//// Ou seja, ao acessar uma chave no nosso dicionário e atribuindo ela a nil, estamos removendo esse valor do dicionário
print(dicionario)
//[2: nil, 1: Optional("Fekipe")]



dicionario.updateValue(nil, forKey: 0)
print(dicionario)
//[2: nil, 1: Optional("Fekipe"), 0: nil]

