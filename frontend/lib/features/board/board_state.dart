import 'package:conference_bingo/local_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final boardStateProvider = StateNotifierProvider.autoDispose
    .family<BoardState, Set<int>, String>((ref, boardHash) {
  return BoardState(boardHash);
});

class BoardState extends StateNotifier<Set<int>> {
  final String boardHash;
  final LocalStorageService _storageService = LocalStorageService();

  BoardState(this.boardHash) : super({}) {
    _loadState();
  }

  Future<void> _loadState() async {
    state = await _storageService.loadBoardState(boardHash);
  }

  void toggle(int index) {
    if (state.contains(index)) {
      state = state.difference({index});
    } else {
      state = state.union({index});
    }
    _storageService.saveBoardState(boardHash, state);
  }
}
