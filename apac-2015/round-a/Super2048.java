import java.util.*;

public class Super2048 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int T = in.nextInt();

        for (int t = 1; t <= T; t++) {
            int N = in.nextInt();
            String DIR = in.next();

            int[][] board = new int[N][N];
            for (int i = 0; i < N; i++)
                for (int j = 0; j < N; j++)
                    board[i][j] = in.nextInt();
           
            int[][] newBoard = new int[N][N];
            if (DIR.equals("right")) {
                int currentTile = -1;
                for (int i = 0; i < N; i++) {
                    int formerTile = -1;
                    int formerTileIndex = -1;
                    for (int j = N - 1; j >= 0; j--) {
                        currentTile = board[i][j];
                        if (currentTile == 0) {
                            continue;
                        }
                        if (currentTile == formerTile) {
                            board[i][formerTileIndex] *= 2;
                            board[i][j] = 0;
                            formerTile = -1;
                            formerTileIndex = -1;
                        }
                        else {
                            formerTile = currentTile;
                            formerTileIndex = j;
                        }
                    }
                }

                for (int i = 0; i < N; i++) {
                    int k = N - 1;
                    for (int j = N - 1; j >= 0; j--) {
                        if (board[i][j] != 0) {
                            newBoard[i][k] = board[i][j];
                            k--;
                        }
                    }
                }
            }
            else if (DIR.equals("left")) {
                int currentTile = -1;
                for (int i = 0; i < N; i++) {
                    int formerTile = -1;
                    int formerTileIndex = -1;
                    for (int j = 0; j < N; j++) {
                        currentTile = board[i][j];
                        if (currentTile == 0) {
                            continue;
                        }
                        if (currentTile == formerTile) {
                            board[i][formerTileIndex] *= 2;
                            board[i][j] = 0;
                            formerTile = -1;
                            formerTileIndex = -1;
                        }
                        else {
                            formerTile = currentTile;
                            formerTileIndex = j;
                        }
                    }
                }

                for (int i = 0; i < N; i++) {
                    int k = 0;
                    for (int j = 0; j < N; j++) {
                        if (board[i][j] != 0) {
                            newBoard[i][k] = board[i][j];
                            k++;
                        }
                    }
                }
            }
            else if (DIR.equals("up")) {
                int currentTile = -1;
                for (int j = 0; j < N; j++) {
                    int formerTile = -1;
                    int formerTileIndex = -1;
                    for (int i = 0; i < N; i++) {
                        currentTile = board[i][j];
                        if (currentTile == 0) {
                            continue;
                        }
                        if (currentTile == formerTile) {
                            board[formerTileIndex][j] *= 2;
                            board[i][j] = 0;
                            formerTile = -1;
                            formerTileIndex = -1;
                        }
                        else {
                            formerTile = currentTile;
                            formerTileIndex = i;
                        }
                    }
                }

                for (int j = 0; j < N; j++) {
                    int k = 0;
                    for (int i = 0; i < N; i++) {
                        if (board[i][j] != 0) {
                            newBoard[k][j] = board[i][j];
                            k++;
                        }
                    }
                }
            }
            else {
                int currentTile = -1;
                for (int j = 0; j < N; j++) {
                    int formerTile = -1;
                    int formerTileIndex = -1;
                    for (int i = N - 1; i >= 0; i--) {
                        currentTile = board[i][j];
                        if (currentTile == 0) {
                            continue;
                        }
                        if (currentTile == formerTile) {
                            board[formerTileIndex][j] *= 2;
                            board[i][j] = 0;
                            formerTile = -1;
                            formerTileIndex = -1;
                        }
                        else {
                            formerTile = currentTile;
                            formerTileIndex = i;
                        }
                    }
                }

                for (int j = 0; j < N; j++) {
                    int k = N - 1;
                    for (int i = N - 1; i >= 0; i--) {
                        if (board[i][j] != 0) {
                            newBoard[k][j] = board[i][j];
                            k--;
                        }
                    }
                }
            }

            System.out.printf("Case #%d: \n", t);
            for (int i = 0; i < N; i++) {
                for (int j = 0; j < N; j++) {
                    System.out.print(newBoard[i][j] + " ");
                }
                System.out.println();
            }
    
        }
    }
}
