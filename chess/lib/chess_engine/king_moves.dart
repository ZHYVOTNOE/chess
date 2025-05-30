class KingMoves {
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

    if ((fromRow - toRow).abs() <= 1 && (fromCol - toCol).abs() <= 1) {
      String? movingPiece = board[fromRow][fromCol];
      String? targetPiece = board[toRow][toCol];

      if (targetPiece == null) {
        return true;
      }

      bool isWhiteMoving = movingPiece!.contains('lt');
      bool isWhiteTarget = targetPiece.contains('lt');

      return isWhiteMoving != isWhiteTarget;
    }

    return false;
  }
}
