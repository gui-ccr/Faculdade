class Animal {
    void fazerSom() {
        System.out.println("O animal faz um som qualquer...");
    }
}

class Gato extends Animal {
    // O Gato muda a forma da ação original
    @Override
    void fazerSom() {
        System.out.println("O gato faz: Miau!");
    }
}

class Cachorro extends Animal {
    // O Cachorro também muda a forma da ação original
    @Override
    void fazerSom() {
        System.out.println("O cachorro faz: Au au!");
    }
}

public class ExemploPolimorfismo {
    public static void main(String[] args) {
        Animal meuGatinho = new Gato();
        Animal meuCachorrinho = new Cachorro();

        // O mesmo comando... resultados diferentes!
        meuGatinho.fazerSom();      // Resultado: O gato faz: Miau!
        meuCachorrinho.fazerSom();  // Resultado: O cachorro faz: Au au!
    }
}