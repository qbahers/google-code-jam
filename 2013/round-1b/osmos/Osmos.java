import java.util.*;

public class Osmos {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();

        for (int t = 1; t <= T; t++) {
            int A = in.nextInt(), N = in.nextInt();

            LinkedList<Integer> sizes = new LinkedList<Integer>();
            for (int i = 0; i < N; i++) {
                sizes.add(in.nextInt());
            }

            Collections.sort(sizes);
            System.out.printf("Case #%d: %d\n", t, solve(A, sizes, 0));
        }
    }

    private static int solve(int A, LinkedList<Integer> sizes, int minNbOperations) {
        if (sizes.size() == 0) {
            return minNbOperations;
        }
        else {
            if (A > sizes.peekFirst()) {
                return solve(A + sizes.removeFirst(), sizes, minNbOperations);
            }
            else {
                if ((A - 1) > 0) {
                    LinkedList<Integer> sizes1 = (LinkedList<Integer>) sizes.clone();
                    sizes1.addFirst(A - 1);
                    sizes.removeFirst();
                    return Math.min(solve(A, sizes1, minNbOperations + 1), solve(A, sizes, minNbOperations + 1));
                }
                else {
                    sizes.removeFirst();
                    return solve(A, sizes, minNbOperations + 1);
                }
            }
        }
    }   
}
