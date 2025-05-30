class PawnMoves {
  static bool isLegal({
    required String color,
    required int fromRow,
    required int fromCol,
    required int toRow,
    required int toCol,
    required List<List<String?>> board,
    required int? lastPawnDoubleMoveRow,
    required int? lastPawnDoubleMoveCol,
  }) {
    if (toRow < 0 || toRow > 7 || toCol < 0 || toCol > 7) {
      return false;
    }

    int direction = color == 'white' ? -1 : 1;
    int startRow = color == 'white' ? 6 : 1;

    if (fromCol == toCol) {
      if (toRow == fromRow + direction && board[toRow][toCol] == null) {
        return true;
      }

      if (fromRow == startRow &&
          toRow == fromRow + 2 * direction &&
          board[fromRow + direction][toCol] == null &&
          board[toRow][toCol] == null) {
          return true;
        }
      }

      if ((toCol - fromCol).abs() == 1 && toRow == fromRow + direction) {
        if (board[toRow][toCol] != null) {
          return true;
        }

        if (lastPawnDoubleMoveRow != null &&
            lastPawnDoubleMoveCol == toCol &&
            lastPawnDoubleMoveRow == fromRow) {
          return true;
        }
      }
      return false;
  }
}