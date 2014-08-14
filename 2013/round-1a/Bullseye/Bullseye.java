import java.util.*;

public class Bullseye {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();

        for (int i = 1; i <= T; i++) {
            long r = in.nextLong();
            long t = in.nextLong();

            long paintNeeded = 0;
            long k = 0;
            while (paintNeeded <= t) {
                paintNeeded += 2 * r + 4 * k + 1;
                k++;
            }
            long nbBlackRings = k - 1;
            System.out.printf("Case #%d: %d\n", i, nbBlackRings);
        }
    }
}
