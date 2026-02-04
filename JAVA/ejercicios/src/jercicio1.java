import javax.swing.JOptionPane;

public class jercicio1 {
    public static void main(String[] args) throws Exception {
        
        int num = 0;
        
        num = Integer.parseInt(JOptionPane.showInputDialog("Ingrese un número:"));

        while (num >= 1) {
            System.out.println(num % 2 == 0);

            num -= 1;
        }

    }
}
