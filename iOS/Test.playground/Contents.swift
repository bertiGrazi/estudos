
import UIKit

// Class

// variáveis e constantes
// criamos métodos
// trabalhar com herança
// implementar protocolos

class Pessoa {
    // MARK : - Atributos
    
    var nome: String
    let sobrenome: String
    
    // MARK: - Método construtor
    
    init(nome: String, sobrenome: String) {
        self.nome = nome
        self.sobrenome = sobrenome
    }
}

let aluno = Pessoa(nome: "Diego", sobrenome: "Silva")

let novoAluno = aluno
//
//print("Alunos: --")
//print(aluno.nome)
//print(novoAluno.nome)
//
//aluno.nome = "Alberto"
//
//print("Após Alteração: --")
//print(aluno.nome)
//print(novoAluno.nome)

struct Pessoa2 {
    // ela tem métodos, variaves, construtores..
    
    // 1 - Struct não precisa, necessariamente, criar um construtor. Ele mesmo cria pra gente.
    // 2 - Value Type
    // 3 - Só conseguimos implementar protocolos e não heranças
    
    //MARK: - Atributos
    var nome: String
    var sobrenome: String
    var nomeCompleto: String {
        //Variavel Computada = Variável que consegue fazer algum tipo de lógica antes de devolver o valor.
        // Temos que retornar sempre o Tipo dela
        return "\(nome) \(sobrenome)"
    }
}

var aluno2 = Pessoa2(nome: "Diego", sobrenome: "Silva")
let novoAluno2 = aluno

print("Alunos: --")
print(aluno2.nome)
print(novoAluno2.nome)


aluno2.nome = "Felipe"

print("Novos Valores: --")
print(aluno2.nome) //Felipe
print(novoAluno2.nome) // Diego

// Estamos trabalhando com a cópia do valor = Value Type
// Os objetos são independentes, cada um com a suas caracteristicas.
// Não conseguimos usar herança, mas consegue implementar um protocolo.

print("Variavel Computada: --")
print(aluno2.nomeCompleto)
