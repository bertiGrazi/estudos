package br.com.bytebank.banco.test;

import br.com.bytebank.banco.modelo.Conta;
import br.com.bytebank.banco.modelo.ContaCorrente;
import br.com.bytebank.banco.modelo.GuardadosDeContas;

public class TesteGuardadosDeContas {

	public static void main(String[] args) {
		
		GuardadosDeContas guardador = new GuardadosDeContas();
		
		Conta cc = new ContaCorrente(22, 11);
		Conta cc2 = new ContaCorrente(33, 22);
		
		guardador.adiciona(cc);
		guardador.adiciona(cc2);
		
		int tamanho = guardador.getQuantidadeDeContas();
		System.out.println("Quantidades de Contas Correntes Adicionas: " + tamanho);
		
		//Acessar os dados que temos guardados nos nossos Arrays
		
		//Quero pegar as referencia que tenho nos meus Array. A minha variavek
		// tem que ser do tipo conta, porque eh o que eu quero acessar. 
		Conta ref = guardador.getReferencia(0); //de quem eu quero
		System.out.println("Numero da Conta: " + ref.getNumero()); //imprimindo o valor de quem eu quero
	}
}
