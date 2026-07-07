import javax.swing.JOptionPane;

public class Compra {

    public static void main(String[] args) {
        // TODO code application logic here
        String e;
        float preco, precofinal;
        
        do {
            e = JOptionPane.showInputDialog("Informe o preço da compra");
            preco = Float.parseFloat(e);
        } while(preco <= 0);      
                
        int r = JOptionPane.showConfirmDialog(null, 
                "Pagar a vista?", "App...", 
                JOptionPane.YES_NO_OPTION);    
        //pagamento a vista
        if (r == JOptionPane.YES_OPTION) {
            float desconto = 5/100.0f * preco;
            precofinal = preco - desconto;
        }    
        //pagamento a prazo
        else {
           r = JOptionPane.showConfirmDialog(null, 
                "Pagar com prazo superior a 30 dias?", "App...", 
                JOptionPane.YES_NO_OPTION);
           //Prazo superior a 30 dias
           if (r == JOptionPane.YES_OPTION) {
               precofinal = 1.07f * preco;
           }
           //Prazo inferior ou igual a 30 dias
           else {
               precofinal = preco;
           }
        }
        
        
        JOptionPane.showMessageDialog(null, 
            "Preço final: " + String.format("%.2f", precofinal));        
    }
    
}
