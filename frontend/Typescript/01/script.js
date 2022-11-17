"use strict";
//@ts-check = O editor passará a indicar errors que seriam pegos pelo TS
const frase = 'Front End';
const total = 100.05;
const empresas = ['Apple', 'Origamid'];
const body = document.body;
console.log(frase.toLowerCase());
//arredonda nossos falores
//retorna uma string e não mais um número
console.log(total.toFixed() + 10);
//Resultado: 10010
console.log(empresas.map((empresa) => empresa.toLocaleLowerCase()));
body.style.background = '#034673';
const operacao = 100 + 1;
//Type Anotations
const produtos = [
    {
        name: 'Harry Potter',
        tipo: 'fantasia',
    },
    {
        name: 'Harry Potter',
        tipo: 'fantasia',
    },
    {
        name: 'Harry Potter',
        tipo: 'fantasia',
    },
];
//DX = Developer Experience = auto completar
function filtrarLivros(dados) {
    return dados.filter((item) => item.tipo === 'fantasia');
}
console.log(filtrarLivros(produtos));
// return []
