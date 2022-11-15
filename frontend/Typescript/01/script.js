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

body.style.background = '#000000';

const operacao = 100 + 1;
