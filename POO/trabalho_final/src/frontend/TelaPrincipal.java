package frontend;

import backend.Equipamento;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

public class TelaPrincipal extends JFrame {
    private JTable table;
    private DefaultTableModel tableModel;
    private List<Equipamento> listaEquipamentos;
    private int nextId = 1;

    public TelaPrincipal() {
        setTitle("Almoxarifado - Equipamentos");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setExtendedState(JFrame.MAXIMIZED_BOTH);
        setLayout(new BorderLayout());

        listaEquipamentos = new ArrayList<>();

        // Tabela
        String[] colunas = {"Id", "Nome", "Modelo", "Preço"};
        tableModel = new DefaultTableModel(colunas, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false; // Não permitir edição direta na tabela
            }
        };
        table = new JTable(tableModel);
        table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        table.getTableHeader().setReorderingAllowed(false);
        JScrollPane scrollPane = new JScrollPane(table);
        add(scrollPane, BorderLayout.CENTER);

        // Painel Inferior com Botões
        JPanel painelBotoes = new JPanel();
        painelBotoes.setLayout(new FlowLayout(FlowLayout.CENTER, 20, 10));

        JButton btnNovo = new JButton("Novo");
        JButton btnEditar = new JButton("Editar/Mostrar");
        JButton btnExcluir = new JButton("Excluir");

        painelBotoes.add(btnNovo);
        painelBotoes.add(btnEditar);
        painelBotoes.add(btnExcluir);

        add(painelBotoes, BorderLayout.SOUTH);

        // Ações dos botões
        btnNovo.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                TelaRegistro tela = new TelaRegistro(TelaPrincipal.this, null, nextId);
                tela.setVisible(true);
            }
        });

        btnEditar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int linhaSelecionada = table.getSelectedRow();
                if (linhaSelecionada == -1) {
                    JOptionPane.showMessageDialog(TelaPrincipal.this,
                            "Selecione um equipamento na tabela para editar.",
                            "Erro", JOptionPane.ERROR_MESSAGE);
                } else {
                    int id = (int) tableModel.getValueAt(linhaSelecionada, 0);
                    Equipamento equipamentoSelecionado = buscarEquipamentoPorId(id);
                    if (equipamentoSelecionado != null) {
                        TelaRegistro tela = new TelaRegistro(TelaPrincipal.this, equipamentoSelecionado, equipamentoSelecionado.getId());
                        tela.setVisible(true);
                    }
                }
            }
        });

        btnExcluir.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int linhaSelecionada = table.getSelectedRow();
                if (linhaSelecionada == -1) {
                    JOptionPane.showMessageDialog(TelaPrincipal.this,
                            "Selecione um equipamento na tabela para excluir.",
                            "Erro", JOptionPane.ERROR_MESSAGE);
                } else {
                    int confirmacao = JOptionPane.showConfirmDialog(TelaPrincipal.this,
                            "Realmente deseja excluir o equipamento selecionado?",
                            "Confirmar Exclusão", JOptionPane.YES_NO_OPTION);
                    if (confirmacao == JOptionPane.YES_OPTION) {
                        int id = (int) tableModel.getValueAt(linhaSelecionada, 0);
                        Equipamento eq = buscarEquipamentoPorId(id);
                        if (eq != null) {
                            listaEquipamentos.remove(eq);
                            atualizarTabela();
                        }
                    }
                }
            }
        });
    }

    private Equipamento buscarEquipamentoPorId(int id) {
        for (Equipamento eq : listaEquipamentos) {
            if (eq.getId() == id) {
                return eq;
            }
        }
        return null;
    }

    public void adicionarEquipamento(Equipamento eq) {
        listaEquipamentos.add(eq);
        nextId++;
        atualizarTabela();
    }

    public void atualizarTabela() {
        tableModel.setRowCount(0); // Limpa a tabela
        for (Equipamento eq : listaEquipamentos) {
            Object[] row = {
                    eq.getId(),
                    eq.getNome(),
                    eq.getModelo(),
                    eq.getPreco()
            };
            tableModel.addRow(row);
        }
    }
}
