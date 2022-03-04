package br.com.bytebank.banco.teste;

import br.com.bytebank.banco.modelo.Conta;
import br.com.bytebank.banco.modelo.ContaCorrente;

public class TesteObject {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("x");
		System.out.println(3);
		System.out.println(false);
		
		ContaCorrente cc = new ContaCorrente(22, 33);
		ContaCorrente cp = new ContaCorrente(33, 22);
		
		System.out.println(cc);
		System.out.println(cp);
		
		println(cp);
	}
	
	//Sobrecarga = mesmo nome de metodos com parametros diferentes
	static void println() {}
	
	static void println(int a) {}
	
	static void println(boolean valor) {}
	
	static void println(Conta conta) {}
}
