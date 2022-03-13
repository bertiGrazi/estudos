package br.com.bytebank.banco.test;

import br.com.bytebank.banco.modelo.Conta;
import br.com.bytebank.banco.modelo.GuardadosDeContas;

public class TesteGuardadosDeContas {

	public static void main(String[] args) {
		
		GuardadosDeContas guardador = new GuardadosDeContas();
		
		Conta cc = new Conta(22, 11);
		
		//guardador.adiciona(cc);

	}

}
