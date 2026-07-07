package frontend;

import backend.Equipamento;

import javax.swing.*;
import javax.swing.text.MaskFormatter;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.ParseException;

public class TelaRegistro extends JDialog {
    private JTextField txtId;
    private JTextField txtNome;
    private JTextField txtMarca;
    private JTextField txtModelo;
    private JFormattedTextField txtDataAquisicao;
    private JTextField txtPreco;
    private JTextArea txtObservacao;
    private JButton btnCadastrar;

    private TelaPrincipal telaPrincipal;
    private Equipamento equipamentoEdicao;
    private boolean isEdicao;

    public TelaRegistro(TelaPrincipal parent, Equipamento equipamento, int currentId) {
        super(parent, "Registro de Equipamento", true);
        this.telaPrincipal = parent;
        this.equipamentoEdicao = equipamento;
        this.isEdicao = (equipamento != null);

        setSize(400, 450);
        setLocationRelativeTo(parent);
        setLayout(new BorderLayout());

        JPanel panelForm = new JPanel(new GridLayout(7, 2, 10, 10));
        panelForm.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Instanciando campos
        txtId = new JTextField(String.valueOf(currentId));
        txtId.setEditable(false);

        txtNome = new JTextField();
        txtMarca = new JTextField();
        txtModelo = new JTextField();

        try {
            MaskFormatter dateMask = new MaskFormatter("##/##/####");
            dateMask.setPlaceholderCharacter('_');
            txtDataAquisicao = new JFormattedTextField(dateMask);
        } catch (ParseException e) {
            txtDataAquisicao = new JFormattedTextField();
        }

        txtPreco = new JTextField();

        txtObservacao = new JTextArea(3, 20);
        JScrollPane scrollObservacao = new JScrollPane(txtObservacao);

        // Adicionando ao painel
        panelForm.add(new JLabel("ID:"));
        panelForm.add(txtId);
        
        panelForm.add(new JLabel("Nome:"));
        panelForm.add(txtNome);

        panelForm.add(new JLabel("Marca:"));
        panelForm.add(txtMarca);

        panelForm.add(new JLabel("Modelo:"));
        panelForm.add(txtModelo);

        panelForm.add(new JLabel("Data Aquisição (DD/MM/AAAA):"));
        panelForm.add(txtDataAquisicao);

        panelForm.add(new JLabel("Preço:"));
        panelForm.add(txtPreco);

        panelForm.add(new JLabel("Observação:"));
        panelForm.add(scrollObservacao);

        add(panelForm, BorderLayout.CENTER);

        JPanel panelBotoes = new JPanel();
        btnCadastrar = new JButton(isEdicao ? "Editar" : "Cadastrar");
        panelBotoes.add(btnCadastrar);
        add(panelBotoes, BorderLayout.SOUTH);

        // Carregar dados se for edição
        if (isEdicao) {
            txtId.setText(String.valueOf(equipamentoEdicao.getId()));
            txtNome.setText(equipamentoEdicao.getNome());
            txtMarca.setText(equipamentoEdicao.getMarca());
            txtModelo.setText(equipamentoEdicao.getModelo());
            txtDataAquisicao.setText(equipamentoEdicao.getDataAquisicao());
            txtPreco.setText(equipamentoEdicao.getPreco());
            txtObservacao.setText(equipamentoEdicao.getObservacao());
        }

        btnCadastrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                salvarRegistro();
            }
        });
    }

    private void salvarRegistro() {
        Equipamento eq = isEdicao ? equipamentoEdicao : new Equipamento();

        // Validar e setar atributos utilizando os métodos do BackEnd
        if (!eq.setId(txtId)) {
            mostrarErro("Erro no ID.");
            return;
        }
        if (!eq.setNome(txtNome)) {
            mostrarErro("Nome é obrigatório.");
            return;
        }
        if (!eq.setMarca(txtMarca)) {
            mostrarErro("Marca é obrigatória.");
            return;
        }
        if (!eq.setModelo(txtModelo)) {
            mostrarErro("Modelo é obrigatório.");
            return;
        }
        if (!eq.setDataAquisicao(txtDataAquisicao)) {
            mostrarErro("Data de Aquisição inválida. Use o formato DD/MM/AAAA com uma data real.");
            return;
        }
        if (!eq.setPreco(txtPreco)) {
            mostrarErro("Preço inválido. Digite um valor numérico.");
            return;
        }
        
        // Observação não tem validação rigorosa
        eq.setObservacao(txtObservacao);

        if (!isEdicao) {
            telaPrincipal.adicionarEquipamento(eq);
            JOptionPane.showMessageDialog(this, "Equipamento cadastrado com sucesso!", "Sucesso", JOptionPane.INFORMATION_MESSAGE);
        } else {
            telaPrincipal.atualizarTabela();
            JOptionPane.showMessageDialog(this, "Equipamento editado com sucesso!", "Sucesso", JOptionPane.INFORMATION_MESSAGE);
        }

        dispose(); // Fecha a tela de registro
    }

    private void mostrarErro(String mensagem) {
        JOptionPane.showMessageDialog(this, mensagem, "Erro de Validação", JOptionPane.ERROR_MESSAGE);
    }
}
