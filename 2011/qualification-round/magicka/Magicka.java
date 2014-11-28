import java.util.*;

public class Magicka {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        
        int T = in.nextInt();
        for (int t = 1; t <= T; t++) {
            int C = in.nextInt();
            Map<String, String> combine = new HashMap<String, String>();
            for (int c = 0; c < C; c++) {
                String s = in.next();
                String pair1 = "" + s.charAt(0) + s.charAt(1);
                String pair2 = "" + s.charAt(1) + s.charAt(0);
                String nonBaseElement = "" + s.charAt(2);
                combine.put(pair1, nonBaseElement);
                combine.put(pair2, nonBaseElement);
            }

            int D = in.nextInt();
            Set<String> opposed = new HashSet<String>();
            for (int d = 0; d < D; d++) {
                String pair1 = in.next();
                String pair2 = "" + s.charAt(1) + s.charAt(0);
                opposed.add(pair1);
                opposed.add(pair2);
            }

            int N = in.nextInt();
            StringBuilder elementList = new StringBuilder(in.next());
            for (int k = 1; k < N; k++) {
                String pair = elementList.substring(k - 1, k + 1);
                if (combine.containsKey(pair)) {
                    elementList.replace(k - 1, k + 1, combine.get(pair));
                    N = elementList.length();
                    k = 0;
                }
                for (int l = 0; l < k; l++) {
                    pair = "" + elementList.charAt(l) + elementList.charAt(k);
                    if (opposed.contains(pair)) {
                        elementList.delete(0, k + 1);
                        N = elementList.length();
                        k = 0;
                    }
                }

            }

            List<Character> res = new ArrayList<Character>();
            for (int i = 0; i < N; i++)
                res.add(elementList.charAt(i));
            System.out.printf("Case #%d: %s\n", t, res.toString());
        }
    }
}
