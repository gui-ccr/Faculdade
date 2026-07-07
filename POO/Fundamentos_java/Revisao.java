/
 *
 
@author João*/
import javax.swing.JOptionPane;
public class Revisao {

    /
     
@param args the command line arguments/
  public static void main(String[] args) {
      // Entrada de dados

      String e = JOptionPane.showInputDialog("Digite o valor da compra: ");
      double precoOriginal = Double.parseDouble(e); 

      //Validação 

      if (precoOriginal <= 0){
          JOptionPane.showMessageDialog(null, "Erro O valor deve ser maior que zero.");

      }else {
          double precoFinal = precoOriginal;

          // a vista?
          int respostaAvista = JOptionPane.showConfirmDialog(null, "Deseja pagar á vista?", "Forma de Pagamento", JOptionPane.YES_NO_OPTION);

        if (respostaAvista == JOptionPane.YES_OPTION){
            // 5%
            precoFinal = precoOriginal 0.95;
        }else {//prazo > 30 dias
            int respostaPrazo = JOptionPane.showConfirmDialog(null, "O prazo é superior a 30 dias?", "Condição de Prazo", JOptionPane.YES_NO_OPTION);
            if (respostaPrazo == JOptionPane.YES_OPTION){// 7%
                precoFinal = precoOriginal * 1.07;}
        }// saida formatada
        String f = String.format("Resumo da Compra: \nValor Original: R$ %.2f\nValor final: R$ %.2f", precoOriginal, precoFinal);
        JOptionPane.showMessageDialog(null, f);
      }


  }
}