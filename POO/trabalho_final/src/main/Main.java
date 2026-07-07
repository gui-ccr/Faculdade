package main;

import frontend.TelaPrincipal;

import javax.swing.*;

public class Main {
    public static void main(String[] args) {
        // Tenta usar o LookAndFeel do sistema operacional para uma interface mais nativa
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            System.err.println("Não foi possível carregar o LookAndFeel do sistema.");
        }

        // Inicia a aplicação na thread de eventos do Swing (boa prática)
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                TelaPrincipal tela = new TelaPrincipal();
                tela.setVisible(true);
            }
        });
    }
}
