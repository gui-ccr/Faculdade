// 1. A CLASSE (O molde)
class Gato {
    // Características (Atributos) que todo gato tem
    String nome;
    String cor;

    // Ações (Métodos) que todo gato faz
    void miar() {
        System.out.println(nome + " diz: Miau!");
    }
}

public class ExemploObjeto {
    public static void main(String[] args) {
        
        // 2. O OBJETO (O gato de verdade)
        // Aqui estamos "assando o biscoito" usando o molde Gato
        Gato meuGato = new Gato(); 
        
        // Dando as características para este objeto específico
        meuGato.nome = "Frajola";
        meuGato.cor = "Preto e Branco";

        // Fazendo o objeto executar uma ação
        meuGato.miar(); // Resultado na tela: Frajola diz: Miau!
    }
}