import java.util.*;

public class EqualSums {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();

        for (int t = 1; t <= T; t++) {
            System.out.printf("Case #%d: \n", t);

            int N = in.nextInt();

            int[] S = new int[N];
            for (int i = 0; i < N; i++) {
                S[i] = in.nextInt();
            }

            Map<Integer, Set<Integer>> powerSet = new HashMap<Integer, Set<Integer>>();
            for (int i = 0; i < Math.pow(2, N); i++) {
                Set<Integer> subset = new HashSet<Integer>();
                String binaryString = Integer.toBinaryString(i);
                while (binaryString.length() < N) {
                    binaryString = "0" + binaryString;
                }

                int sum = 0;
                for (int j = 0; j < N; j++) {
                    if (binaryString.charAt(j) == '1') {
                        subset.add(S[j]);
                        sum += S[j];
                    }
                }
                if (powerSet.containsKey(sum)) {
                    display(powerSet.get(sum));
                    display(subset);
                    break;
                } 
                else {
                    powerSet.put(sum, subset);
                }
            }
            if (powerSet.size() == Math.pow(2, N)) {
                System.out.println("Impossible");
            }
        }
    }
    
    private static void display(Set<Integer> set) {
        for (Integer e : set) {
            System.out.printf("%d ", e);
        }
        System.out.println();
    }
}
