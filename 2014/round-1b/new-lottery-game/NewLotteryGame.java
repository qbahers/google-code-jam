import java.util.*;

public class NewLotteryGame {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();

        for (int t = 1; t <= T; t++) {
            int A = in.nextInt();
            int B = in.nextInt();
            int K = in.nextInt();
            
            int nbPossiblePairs = 0;
            for (int i = 0; i < A; i++) {
                for (int j = 0; j < B; j++) {
                    if ((i & j) < K) {
                        nbPossiblePairs++;
                    }
                }
            }
            System.out.printf("Case #%d: %d\n", t, nbPossiblePairs);
        }
    }
}
