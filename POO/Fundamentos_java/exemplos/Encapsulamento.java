class ContaBancaria {
    // O "private" é o nosso cofre. Ninguém de fora pode mexer diretamente no saldo!
    private double saldo = 0;

    // Esse é o "botão" seguro que deixamos as pessoas usarem (public)
    public void depositar(double valor) {
        if (valor > 0) {
            saldo = saldo + valor;
            System.out.println("Depósito de " + valor + " realizado com sucesso!");
        } else {
            System.out.println("Valor inválido para depósito.");
        }
    }

    // Outro "botão" seguro só para olhar o saldo
    public void mostrarSaldo() {
        System.out.println("Seu saldo é: " + saldo);
    }
}

public class ExemploEncapsulamento {
    public static void main(String[] args) {
        ContaBancaria minhaConta = new ContaBancaria();

        // minhaConta.saldo = 1000000; -> ISSO DARIA ERRO! O saldo é "private" (protegido).

        // O jeito certo e seguro de mexer no dinheiro:
        minhaConta.depositar(50);
        minhaConta.mostrarSaldo(); // Resultado: Seu saldo é: 50.0
    }
}