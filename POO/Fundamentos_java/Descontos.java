/*
* Requisitos
ler o preço final da compra e a forma de pagamento

* FORMAS DE PAGAMENTO
- 1 a vista
- 2 credito a vista
- 3 credito parcelado 

* VALIDAÇÔES

se a forma de pagamento foi informada corretamente

podendo ser maiscula ou minuscula

em caso de erro informar a pergunta novamente 

* DESCONSTOS

a vista 15% desconto

credito a vista o preço se mantem 

parcelado acrescima de 4.5%

* SAIDA
valor final a pagar

*/

import javax.swing.JOptionPane;

public class Descontos {

    public static void main(String[] args) {

        String e;
        e = JOptionPane.showInputDialog("Informe o preço final da compra: ");
        double precoFinal = Double.parseDouble(e);

        String f;
        f = JOptionPane.showInputDialog("""
                    Selecione sua forma de pagamento
                    1 - A vista
                    2 - Credito a vista
                    3 - Credito a prazo
                """);

        int opcao = Integer.parseInt(f);
        while (opcao < 1 || opcao > 3) { // verificação do valor selecionado
            JOptionPane.showMessageDialog(null, "Valor selecionado incorreto, por favor seleciona apenas 1, 2 ou 3");

            f = JOptionPane.showInputDialog("""
                        Selecione sua forma de pagamento
                        1 - A vista
                        2 - Credito a vista
                        3 - Credito a prazo
                    """);

            opcao = Integer.parseInt(f);
        }

        double valorFinal = 0;

        switch (opcao) {
            case 1: // desconto 15%
                double x = precoFinal * 0.15;
                valorFinal = precoFinal - x;
                break;

            case 2: // nao acontece nada
                valorFinal = precoFinal;

                break;

            case 3: // acrescimo de 4.5%
                double y = precoFinal * 0.045;
                valorFinal = precoFinal + y;

                break;

            default:
                break;
        }

        JOptionPane.showMessageDialog(null, "O valor final a pagar foi de: " + valorFinal);

    }
}
