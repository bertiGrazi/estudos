"use strict";
//let no ts não é const 
let produto = 'Livro';
const preco = 200;
const carro = {
    marca: "Audi",
    portas: 5,
};
//Inferencia = Consegue inferir o tipo de dado expressado em JS. 
const barato = 200 < 400 ? true : "produto barato";
//As anotações serão necessárias quando lidamos com funções. 
function somar(a, b) {
    return '${a + b}';
}
const nintendo = {
    nome: "Nintendo",
    preco: "2000"
};
function transformarPreco(produto) {
    produto.preco = "R$ " + produto.preco;
    return produto;
}
const produtoNovo = transformarPreco(nintendo);
console.log(produtoNovo);
//Exercicio1
//Conserte a função com TypeScript
function normalizarText(texto) {
    return texto.trim().toLowerCase();
}
// trim = remove os espaços em branco do inicio ao fim de um texto
//toLowerCase = deixa tudo em minusculo. 
const textoNovo = normalizarText("    Grazielli Lima Berti");
console.log(textoNovo);
//Exercicio 02 - Salvar o número no local storage
