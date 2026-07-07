
public class FolhaSalarial {
    private float salarioBase;
    private boolean possuiFilhos;
    private String classeFuncional;

    public FolhaSalarial(float salarioBase, boolean possuiFilhos, String classeFuncional) {
        this.salarioBase = salarioBase;
        this.possuiFilhos = possuiFilhos;
        this.classeFuncional = classeFuncional;
    }

    public float getValorClasse() {
        if (classeFuncional.equals("Junior")) {
            return 289.70f;
        } else if (classeFuncional.equals("Pleno")) {
            return 831.67f;
        } else if (classeFuncional.equals("Senior")) {
            return 2100.31f;
        } else {
            return 0.00f;
        }
    }

    public float getVA() {
        return 682.12f;
    }

    public float getBF() {
        if (possuiFilhos) {
            return 239.67f;
        } else {
            return 0.00f;
        }
    }

    public float getVT() {
        if (salarioBase <= 1039.00f) {
            return 285.85f;
        } else if (salarioBase <= 1546.50f) {
            return 201.43f;
        } else if (salarioBase <= 2143.56f) {
            return 185.71f;
        } else if (salarioBase <= 3002.17f) {
            return 121.33f;
        } else if (salarioBase <= 3702.29f) {
            return 85.18f;
        } else {
            return 78.41f;
        }
    }

    public float getTotalBeneficios() {
        return getVA() + getBF() + getVT();
    }

    public float getSalarioBruto() {
        return salarioBase + getValorClasse();
    }

    public float getIR() {
        float baseCalculo = salarioBase + getValorClasse();

        if (baseCalculo <= 2259.20f) {
            return 0.00f; 
        } else if (baseCalculo <= 2826.65f) {
            return baseCalculo * 0.075f;
        } else if (baseCalculo <= 3751.05f) {
            return baseCalculo * 0.15f;
        } else if (baseCalculo <= 4664.68f) {
            return baseCalculo * 0.22f;
        } else {
            return baseCalculo * 0.275f;
        }
    }

    public float getINSS() {
        float baseCalculo = salarioBase + getValorClasse();

        if (baseCalculo <= 1518.00f) {
            return baseCalculo * 0.075f;
        } else if (baseCalculo <= 2793.88f) {
            return baseCalculo * 0.09f;
        } else if (baseCalculo <= 4190.83f) {
            return baseCalculo * 0.12f;
        } else {
            return baseCalculo * 0.14f;
        }
    }

    public float getTotalDescontos() {
        return getIR() + getINSS();
    }
    
    public float getSalarioLiquido() {
        return getSalarioBruto() - getTotalDescontos();
    }
}