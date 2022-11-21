const input = document.querySelector('input');
const total = localStorage.getItem('total');
if (input && total) {
  input.value = total;
  calcularGanho(Number(input.value));
}


function calcularGanho(value: number) {
  const p = document.querySelector('p');
  if (p) {
    p.innerText = `Ganho total: ${value + 100 - value * 0.2}`;
  }
}

function totalMudou() {
 if (input) {
  //salvando dado
  localStorage.setItem('total', input.value);
  calcularGanho(Number(input.value));
 }
}

// keyup = evento acionando quando uma tecla é liberada
if (input) {
  input.addEventListener('keyup', totalMudou);
}
