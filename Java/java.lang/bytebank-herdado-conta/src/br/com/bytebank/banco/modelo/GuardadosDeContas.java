package br.com.bytebank.banco.modelo;

public class GuardadosDeContas {
	private Conta[] referencias;
	private int posicaoLivre = 0; //Ja me fala quantos elementos tem
	
	public GuardadosDeContas() {
		this.referencias = new Conta[10];
	}
	
	public void adiciona(Conta ref) {
		this.referencias[this.posicaoLivre] = ref;
		this.posicaoLivre++;
	}

	public int getQuantidadeDeContas() {
		return this.posicaoLivre;
	}

	public Conta getReferencia(int posicao) {
		return this.referencias[posicao];
	}
}





/*
 * Para adicionar um Array e verificar a sua posicao
 *	Passo 1) Criar uma funcao adiciona que ira adicionar a nova referencia no array
 *	Passo 2) Criar uma variavel int com a posicao livre desse index
 *	Passo 3) Adicionar essa variavel no index e fazer a incrementacao, pois ela inicia 
 *com 0, e quando ele for ocupada devera ser adicionado. */
 