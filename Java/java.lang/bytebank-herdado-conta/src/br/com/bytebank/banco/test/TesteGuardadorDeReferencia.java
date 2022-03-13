package br.com.bytebank.banco.test;

import br.com.bytebank.banco.modelo.Conta;
import br.com.bytebank.banco.modelo.ContaCorrente;
import br.com.bytebank.banco.modelo.GuardadorDeReferencias;

public class TesteGuardadorDeReferencia {

	public static void main(String[] args) {
		
		GuardadorDeReferencias guardadorRef = new GuardadorDeReferencias();
		
		Conta cc = new ContaCorrente(22, 11);
		guardadorRef.adiciona(cc);
		
		Conta cc2 = new ContaCorrente(33, 44);
		guardadorRef.adiciona(cc2);
		
		int tamanho = guardadorRef.getQuantidadeDeElementos();
		System.out.println(tamanho);
		
		Conta ref = (Conta) guardadorRef.getReferencia(1);
		System.out.println(ref.getAgencia());
	}

}
