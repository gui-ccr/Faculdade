package backend;

import java.util.ArrayList;
import java.util.List;

/*
   // i. Possui todos os métodos de set e get dos atributos;
    
   ? ii. O método getCR() deve retornar a média de todas as notas de disciplinas matriculadas. Caso o aluno não possua nenhuma disciplina matriculada deverá mostrar 0 (zero);
    
   ? iii. O método setMatricularDisciplina(Disciplina, NotaFinal) deve enviar o nome da disciplina e a nota final. Antes de efetuar a matricula deverá ser verificado se o nome da disciplina já foi matriculado antes. Caso a disciplina já estiver matriculada, exibir uma mensagem de erro e retornar falso. Caso contrário, adicionar a disciplina, exibir uma mensagem de confirmação com o nome da disciplina matriculada e retornar verdadeiro;

   ? iv. O método getDisciplinasMatriculadas() deve retornar o nome de todas as disciplinas matriculadas, dividindo cada uma com quebras de linhas, do respectivo aluno. Em cada disciplina deve mostrar, situação da mesma e nota final. Caso não tiver nenhuma disciplina matriculada deverá retornar o texto: “Não existem disciplinas matriculadas”;

*/
public class Aluno {
    private int matricula;
    private String nome;
    private String CPF;

    List<MatriculaDisciplina> listaDisciplinas = new ArrayList<>();

    public Aluno(int matricula, String nome, String cpf) {
        this.matricula = matricula;
        this.nome = nome;
        CPF = cpf;
    }

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCPF() {
        return CPF;
    }

    public void setCPF(String cpf) {
        CPF = cpf;
    }

    public float getCR() {
        if (listaDisciplinas.isEmpty()) {
            System.out.println("a lista de disciplinas esta vazia");
            return 0;
        }
        float somaNotas = 0;
        float mediaFinal = 0;

        for (MatriculaDisciplina matriculaDisciplina : listaDisciplinas) {
            somaNotas = somaNotas + matriculaDisciplina.getNotaFinal();
        }

        mediaFinal = somaNotas / listaDisciplinas.size();

        return mediaFinal;
    }

    public boolean setMatricularDisciplina(String nomeDisciplina, float notaFinal) {
        for (MatriculaDisciplina matriculaDisciplina : listaDisciplinas) {
            if (matriculaDisciplina.getDisciplina().equals(nomeDisciplina)) {
                System.out.println("disciplina ja cadastrada");
                return false;
            }
        }

        MatriculaDisciplina novaMatricula = new MatriculaDisciplina();

        novaMatricula.setDisciplina(nomeDisciplina);
        novaMatricula.setNotaFinal(notaFinal);

        listaDisciplinas.add(novaMatricula);

        return true;

    }

    public String getDisciplinasMatriculadas() {

        String relatorio = "";

        for (MatriculaDisciplina md : listaDisciplinas) {
            relatorio += "Disciplina: " + md.getDisciplina() +
                         " | Nota: " + md.getNotaFinal() +
                         " | Situação: " + md.getSituacao() + "\n";
        }

        return relatorio;
    }

}
