
/**
 * DESAFIO: Calculadora de Conta de Energia
 *
 * ENTRADAS:
 * 1. Total de kW/h consumido no mês.
 * 2. Bandeira tarifária: 1 (Azul), 2 (Amarela) ou 3 (Vermelha).
 * -> Validação: O programa deve garantir que a entrada da bandeira seja estritamente 1, 2 ou 3.
 *
 * REGRAS DE NEGÓCIO E CÁLCULOS:
 * * A) Valor do Consumo Mensa
 * 
 * l = (Total kW/h) * (Valor por kW/h da Bandeira)
 * - Bandeira 1 (Azul): R$ 0,736
 * - Bandeira 2 (Amarela): R$ 0,817
 * - Bandeira 3 (Vermelha): R$ 0,875
 *
 * B) Taxa da Bandeira (Custo Fixo)
 * - Bandeira 1 (Azul): R$ 0,00 (Isento)
 * - Bandeira 2 (Amarela): R$ 4,78
 * - Bandeira 3 (Vermelha): R$ 7,53
 *
 * C) Tarifa de Iluminação Pública
 * - R$ 31,75 + (0,575% sobre o valor calculado no item A)
 *
 * D) Valor Final da Conta
 * - Soma das três taxas: (A + B + C)
 *
 * SAÍDAS ESPERADAS (Exibir na tela):
 * - Detalhamento 1: Valor do Consumo Mensal
 * - Detalhamento 2: Valor da Taxa de Bandeira
 * - Detalhamento 3: Valor da Tarifa de Iluminação Pública
 * - Valor Final da Conta
 */
import javax.swing.JOptionPane;


public class Fundamentos {

    public static void main(String[] args) {

        // -- entrada do total de consumo
        String entradaKww;

        entradaKww = JOptionPane.showInputDialog("Digite o valor de consumo total em Kw/h: ");

        double totalKwh = Double.parseDouble(entradaKww);
        

        String entradaOpcao = JOptionPane.showInputDialog("""
                Selecione a bandeira atribuída:
                 1 - Azul
                 2 - Amarela
                 3 - Vermelha """);

        int opcao = Integer.parseInt(entradaOpcao);

        
        String bandeira = "";
        while (opcao < 1 || opcao > 3) {
            JOptionPane.showMessageDialog(null, "Opção invAlida! Por favor, digite 1, 2 ou 3.");

            entradaOpcao = JOptionPane.showInputDialog("""
                    Tente novamente. Selecione a bandeira:
                     1 - Azul
                     2 - Amarela
                     3 - Vermelha """);

            opcao = Integer.parseInt(entradaOpcao);

            switch (opcao) {
                case 1: bandeira = "Azul";
                    break;
                case 2: bandeira = "Amarelo";
                    break;
                case 3: bandeira = "Vermelho";
                    break;
        
                default:
                    break;
            }
        }

        // -- A) calcular o valor total do consumo --

        double valorTotalConsumo = 0;

        if (bandeira.equalsIgnoreCase("azul")) {
            valorTotalConsumo = totalKwh * 0.736;

        } else if (bandeira.equalsIgnoreCase("amarelo")) {
            valorTotalConsumo = totalKwh * 0.817;

        } else
            valorTotalConsumo = totalKwh * 0.875;

        // -- B) calcular a taxa da bandeira --

        double taxaDaBandeira = 0;

        if (bandeira.equalsIgnoreCase("azul")) {
            taxaDaBandeira = 0;

        } else if (bandeira.equalsIgnoreCase("amarelo")) {
            taxaDaBandeira = 4.78;

        } else
            taxaDaBandeira = 7.53;

        // -- C) Tarifa de Iluminação Pública --

        double tarifaIlumnincao = 31.75 + (0.575 * valorTotalConsumo);

        // -- D) Valor Final da Conta --

        double valorFinal = tarifaIlumnincao + taxaDaBandeira + valorTotalConsumo;

        JOptionPane.showMessageDialog(null, "O valor final da sua conta é: " +  valorFinal);

        System.exit(0);
    }

}
