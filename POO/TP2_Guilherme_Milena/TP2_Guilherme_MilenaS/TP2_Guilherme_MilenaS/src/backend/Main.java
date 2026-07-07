package backend;
    
public class Main {
    public static void main(String[] args) {
        Aluno aluno1 = new Aluno(11, "Guilherme", "12312312312");

        aluno1.setMatricularDisciplina("Portugues", 80);
        aluno1.setMatricularDisciplina("Matematica", 55);
        aluno1.setMatricularDisciplina("Ingles", 90);
       
        System.out.println("CR do aluno: " + aluno1.getCR());
        
        // Chamando o método ajustado que vai retornar a String completinha:
        System.out.println(aluno1.getDisciplinasMatriculadas());
    }
}