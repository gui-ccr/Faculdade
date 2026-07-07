package backend;

import javax.swing.text.JTextComponent;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Equipamento {
    private int id;
    private String nome;
    private String marca;
    private String modelo;
    private String dataAquisicao;
    private float preco;
    private String observacao;

    public boolean setId(JTextComponent textField) {
        String text = textField.getText();
        if (text == null || text.trim().isEmpty()) {
            return false;
        }
        try {
            this.id = Integer.parseInt(text.trim());
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public int getId() {
        return id;
    }

    public boolean setNome(JTextComponent textField) {
        String text = textField.getText();
        if (text == null || text.trim().isEmpty()) {
            return false;
        }
        this.nome = text.trim();
        return true;
    }

    public String getNome() {
        return nome;
    }

    public boolean setMarca(JTextComponent textField) {
        String text = textField.getText();
        if (text == null || text.trim().isEmpty()) {
            return false;
        }
        this.marca = text.trim();
        return true;
    }

    public String getMarca() {
        return marca;
    }

    public boolean setModelo(JTextComponent textField) {
        String text = textField.getText();
        if (text == null || text.trim().isEmpty()) {
            return false;
        }
        this.modelo = text.trim();
        return true;
    }

    public String getModelo() {
        return modelo;
    }

    public boolean setDataAquisicao(JTextComponent textField) {
        String text = textField.getText();
        if (text == null || text.trim().isEmpty()) {
            return false;
        }
        text = text.trim();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(false);
        try {
            sdf.parse(text);
            this.dataAquisicao = text;
            return true;
        } catch (ParseException e) {
            return false;
        }
    }

    public String getDataAquisicao() {
        return dataAquisicao;
    }

    public boolean setPreco(JTextComponent textField) {
        String text = textField.getText();
        if (text == null || text.trim().isEmpty()) {
            return false;
        }
        try {
            this.preco = Float.parseFloat(text.trim().replace(",", "."));
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public String getPreco() {
        return String.valueOf(preco);
    }

    public void setObservacao(JTextComponent textField) {
        if (textField != null) {
            this.observacao = textField.getText();
        }
    }

    public String getObservacao() {
        return observacao;
    }
}
