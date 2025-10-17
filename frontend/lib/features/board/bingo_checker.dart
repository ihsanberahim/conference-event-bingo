class BingoChecker {
  static int countBingos(Set<int> selectedItems, int boardSize) {
    int bingoCount = 0;

    // Generate and check rows
    for (int i = 0; i < boardSize; i++) {
      final condition = List.generate(boardSize, (j) => i * boardSize + j);
      if (selectedItems.containsAll(condition)) bingoCount++;
    }

    // Generate and check columns
    for (int i = 0; i < boardSize; i++) {
      final condition = List.generate(boardSize, (j) => i + j * boardSize);
      if (selectedItems.containsAll(condition)) bingoCount++;
    }

    // Generate and check top-left to bottom-right diagonal
    final diag1 = List.generate(boardSize, (i) => i * (boardSize + 1));
    if (selectedItems.containsAll(diag1)) bingoCount++;

    // Generate and check top-right to bottom-left diagonal
    final diag2 = List.generate(boardSize, (i) => (i + 1) * (boardSize - 1));
    if (selectedItems.containsAll(diag2)) bingoCount++;

    return bingoCount;
  }
}
