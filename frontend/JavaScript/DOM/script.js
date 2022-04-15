const h1Selecionado = document.querySelector('h1');

function callbackh1() {
    console.log(h1Selecionado.innerHTML)
}
h1Selecionado.addEventListener('click', callbackh1);

