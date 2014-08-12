import java.util.*;

public class ChargingChaos { 
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();

        for (int t = 1; t <= T; t++) {
            int N = in.nextInt();
            int L = in.nextInt();

            Set<Long> initial = new HashSet<Long>();
            for (int i = 1; i <= N; i++) {
                String binary = in.next();
                long decimal = Long.parseLong(binary, 2);
                initial.add(decimal);
            }

            Set<Long> required = new HashSet<Long>();
            for (int i = 1; i <= N; i++) {
                String binary = in.next();
                long decimal = Long.parseLong(binary, 2);
                required.add(decimal);
            }

            long k = 1;
            Set<Long> current = new HashSet<Long>(initial); 
            while ((k <= Math.pow(2, L)) && (!current.equals(required))) {
                current.clear();
                for (long e : initial) {
                    current.add(e ^ k);
                }
                k++;
            }

            System.out.printf("Case #%d: ", t);
            if (current.equals(required)) {
                System.out.println(Long.bitCount(k - 1));
            }
            else {
                System.out.println("NOT POSSIBLE");
            }
        }
    }
}
