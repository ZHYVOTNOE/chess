class BishopMoves{
  static bool isLegal({
    required int fromRow,
    required int fromCol,
    required int toRow,
    required int toCol,
    required List<List<String?>> board,
  }) {
    if (toRow < 0 || toRow > 7 || toCol < 0 || toCol > 7) {
      return false;
    }

    if((fromRow - toRow).abs() != (fromCol - toCol).abs()){
      return false;
    }

    int rowStep = (toRow - fromRow) > 0 ? 1 : -1;
    int colStep = (toCol - fromCol) > 0 ? 1 : -1;

    int currentRow = fromRow + rowStep;
    int currentCol = fromCol + colStep;
    while (currentRow != toRow && currentCol != toCol) {
      if (board[currentRow][currentCol] != null) {
        return false;
      }
      currentRow += rowStep;
      currentCol += colStep;
    }

    String? movingPiece = board[fromRow][fromCol];
    String? targetPiece = board[toRow][toCol];

    if (targetPiece == null) {
      return true;
    }

    bool isWhiteMoving = movingPiece!.contains('lt');
    bool isWhiteTarget = targetPiece.contains('lt');

    return isWhiteMoving != isWhiteTarget;
  }
}