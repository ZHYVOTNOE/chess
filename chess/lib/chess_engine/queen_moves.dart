import 'bishop_moves.dart';
import 'rook_moves.dart';

class QueenMoves {
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

    if ((fromRow - toRow).abs() == (fromCol - toCol).abs()) {
      return BishopMoves.isLegal(
        fromRow: fromRow,
        fromCol: fromCol,
        toRow: toRow,
        toCol: toCol,
        board: board,
      );
    }

    if (fromRow == toRow || fromCol == toCol) {
      return RookMoves.isLegal(
        fromRow: fromRow,
        fromCol: fromCol,
        toRow: toRow,
        toCol: toCol,
        board: board,
      );
    }

    // Иначе — ферзь так не ходит
    return false;
  }
}
