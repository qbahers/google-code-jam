import java.util.*;

public class PartElf {
    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();

        for (int t = 1; t <= T; t++) {
            String fraction = in.next();
            String[] parts = fraction.split("/");
            int P = Integer.parseInt(parts[0]);
            int Q = Integer.parseInt(parts[1]);

            System.out.printf("Case #%d: ", t);
            
            int k = 0;
            while (Q % 2 == 0) {
                Q /= 2;
                k++;
            }
            if (Q == 1) {
                int l = 0;
                while (((double) P) / Math.pow(2, l) >= 1) {
                    l++;
                }
                l--;
                System.out.println(k - l);
            }
            else {
                System.out.println("impossible");
            }
        }
    }
}
