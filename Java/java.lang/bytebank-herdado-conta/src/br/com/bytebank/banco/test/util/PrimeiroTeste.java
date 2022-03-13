package br.com.bytebank.banco.test.util;

import java.util.ArrayList;

import br.com.bytebank.banco.modelo.Conta;
import br.com.bytebank.banco.modelo.ContaCorrente;

public class PrimeiroTeste {

	public static void main(String[] args) {
		
		ArrayList lista = new ArrayList();
		
		Conta cc = new ContaCorrente(22, 11);
		lista.add(cc);
		
		Conta cc2 = new ContaCorrente(22, 22);
		lista.add(cc2);
		
		int tamanho = lista.size();
		System.out.println("Tamanho da lista: " + tamanho);
		
		lista.remove(1);
		
		System.out.println("Tamanho da lista: " + lista.size());
		
		System.out.println("------------");
		
		for(int i = 0; i < lista.size(); i++) {
			Object oRef = lista.get(i);
			System.out.println(oRef);
		}
		System.out.println();
		
		System.out.println("Nova maneira para o for");
		System.out.println("Estamos percorrendo a lista de array que temos: ");
		for (Object oRef : lista) {
			System.out.println();
			System.out.println(oRef);
		}
	}

}
