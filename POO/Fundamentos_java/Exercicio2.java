/**
 * DESAFIO: Cálculo de Folha Salarial
 *
 * * ENTRADAS:
 * 1. Quantidade de salários mínimos (unidade ou fração).
 * 2. Número de filhos (unidade inteira).
 *
 * * REGRAS DE NEGÓCIO E CÁLCULOS:
 * * A) Base de Cálculo e Benefícios:
 * - Valor do Salário Mínimo: R$ 1.320,00
 * - Auxílio por Filho: R$ 58,00 por unidade.
 * - Vale Alimentação: R$ 350,00 (Fixo).
 *
 * * B) Salário Bruto:
 * - Bruto = (Qtd. Salários * 1320.00) + (Qtd. Filhos * 58.00) + 350.00
 *
 * * C) Descontos (Incidem sobre Bruto exceto Vale Alimentação):
 * - Imposto de Renda: 7,5% sobre (Bruto - 350.00)
 * - Previdência Social: 6,0% sobre (Bruto - 350.00)
 *
 * * D) Salário Líquido:
 * - Líquido = Bruto - (Desconto IR + Desconto Previdência)
 *
 * * SAÍDAS ESPERADAS (Exibir na tela):
 * - Salário Bruto
 * - Valor do Desconto IR
 * - Valor do Desconto Previdência
 * - Total de Descontos
 * - Salário Líquido
 */
import javax.swing.JOptionPane;

public class Exercicio2 {

    public static void main(String[] args) {
        String salarioInicial = JOptionPane.showInputDialog(" Digite quantos salarios minimos voce recebe (unidade ou fração): ");
        String filhoInicial = JOptionPane.showInputDialog(" Digite quantos filhos voce tem: ");

        double salariosMinimos = Double.parseDouble(salarioInicial);
        int filhos = Integer.parseInt(filhoInicial);

        double salarioBruto = (salariosMinimos * 1320.00) + (filhos * 58) + 350;

        double impostoRenda = 0.075 * (salarioBruto - 350);
        double previdenciaSocial = 0.6 * (salarioBruto - 350);
        double totalDesconto = impostoRenda + previdenciaSocial;

        double salarioLiquido = salarioBruto - (impostoRenda + previdenciaSocial);

        String mensagem = String.format(
                "Salário bruto: R$ %.2f\n"
                + "Valor do Desconto IR: R$ %.2f\n"
                + "Valor do Desconto Previdência: R$ %.2f\n"
                + "Total de Descontos: R$ %.2f\n"
                + "Salário Líquido: R$ %.2f",
                salarioBruto, impostoRenda, previdenciaSocial, totalDesconto, salarioLiquido
        );

        JOptionPane.showMessageDialog(null, mensagem);

        System.exit(0);

    }

}