package interfaz;

public class ClaseD implements Operable {
    private int num;

    public ClaseD(int num) {
        this.num = num;
    }

    // Constructor copia
    public ClaseD(ClaseD original) {
        this.num = original.num;
        System.out.println("Constructor copia en D: " + num);
    }

    @Override
    public void operar() {
        System.out.println("Operando en D");
    }   
}
