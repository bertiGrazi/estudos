//let no ts não é const 
let produto: string = 'Livro';
const preco: number = 200;

const carro: {
  marca: string;
  portas: number;
} = {
  marca: "Audi", 
  portas: 5,
}

//Inferencia = Consegue inferir o tipo de dado expressado em JS. 

const barato: boolean | string = 200 < 400 ? true : "produto barato"; 

//As anotações serão necessárias quando lidamos com funções. 

function somar(a: number, b: number): string {
  return '${a + b}';
}

const nintendo = {
  nome: "Nintendo",
  preco: "2000"
}

function transformarPreco(produto: {nome: string, preco: string}) {
  produto.preco = "R$ " + produto.preco
  return produto
}

const produtoNovo = transformarPreco(nintendo)

console.log(produtoNovo)

//Exercicio1
//Conserte a função com TypeScript
function normalizarText(texto: string) {
  return texto.trim().toLowerCase();
}

// trim = remove os espaços em branco do inicio ao fim de um texto
//toLowerCase = deixa tudo em minusculo. 
const textoNovo = normalizarText("    Grazielli Lima Berti")
console.log(textoNovo)

//Exercicio 02 - Salvar o número no local storage