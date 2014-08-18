import java.math.*;
import java.util.*;

public class Bullseye {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();

        for (int i = 1; i <= T; i++) {
            long r = in.nextLong();
            long t = in.nextLong();

            long hi = 1;

            while (check(r, t, hi)) {
                hi *= 2;
            }

            long lo = hi / 2;

            while ((hi - lo) > 1) {
                long mid = (lo + hi) / 2;
                if (check(r, t, mid)) {
                    lo = mid;
                }
                else {
                    hi = mid;
                }    
            }

            System.out.printf("Case #%d: %d\n", i, lo);
        }
    }

    private static boolean check(long r, long t, long k) {
        BigInteger a = BigInteger.valueOf(2*r);
        BigInteger b = BigInteger.valueOf(2*k);
        BigInteger c = BigInteger.valueOf(1);
        BigInteger d = BigInteger.valueOf(k);
        BigInteger e = BigInteger.valueOf(t);
        BigInteger res = a.add(b).subtract(c).multiply(d);
        return res.compareTo(e) <= 0;
    }
}
