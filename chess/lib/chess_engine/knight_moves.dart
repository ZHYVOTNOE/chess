class KnightMoves{
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

    bool isLShapeMove =
        (fromRow - toRow).abs() == 2 && (fromCol - toCol).abs() == 1 ||
            (fromRow - toRow).abs() == 1 && (fromCol - toCol).abs() == 2;

    if (!isLShapeMove) return false;

    String? targetPiece = board[toRow][toCol];
    String? movingPiece = board[fromRow][fromCol];
    if (targetPiece == null) {
      return true;
    }

    bool isWhiteMoving = movingPiece!.contains('lt');
    bool isWhiteTarget = targetPiece.contains('lt');

    return isWhiteMoving != isWhiteTarget;
  }
}