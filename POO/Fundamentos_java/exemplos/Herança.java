// Classe "Pai" (Superclasse)
class Animal {
    String nome;

    // Todo animal come
    void comer() {
        System.out.println(nome + " está comendo.");
    }
}

// Classe "Filha" (Subclasse)
// O "extends" significa que Cachorro herda tudo de Animal
class Cachorro extends Animal {
    
    // Só o cachorro late
    void latir() {
        System.out.println(nome + " diz: Au au!");
    }
}

public class ExemploHeranca {
    public static void main(String[] args) {
        
        // Criando o objeto Cachorro
        Cachorro meuCachorro = new Cachorro();
        
        // Ele HERDOU o atributo "nome" da classe Animal! Não precisamos escrever de novo.
        meuCachorro.nome = "Rex"; 
        
        // Ele HERDOU a ação "comer" da classe Animal!
        meuCachorro.comer(); 
        
        // E ele tem sua própria ação exclusiva de Cachorro
        meuCachorro.latir(); 
    }
}