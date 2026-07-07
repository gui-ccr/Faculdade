package backend;

public class MatriculaDisciplina {
    private String disciplina;
    private float notaFinal;

    public MatriculaDisciplina() {}

    public String getDisciplina() {
        return this.disciplina;
    }

    public float getNotaFinal() {
        return notaFinal;
    }

    public String getSituacao() {
        if (notaFinal < 60) {
            return "Reprovado ate ano que vem!";

        } else {
            return "Aprovado ate nunca mais";
        }

    }

    public void setDisciplina(String disciplina) {
        this.disciplina = disciplina;

    }

    public void setNotaFinal(float notaFinal) {
        this.notaFinal = notaFinal;
    }
}
