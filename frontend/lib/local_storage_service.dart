import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveBoardState(String boardHash, Set<int> selectedItems) async {
    final prefs = await SharedPreferences.getInstance();
    final items = selectedItems.map((e) => e.toString()).toList();
    await prefs.setStringList('board_$boardHash', items);
  }

  Future<Set<int>> loadBoardState(String boardHash) async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList('board_$boardHash');
    if (items == null) {
      return {};
    }
    return items.map((e) => int.parse(e)).toSet();
  }
}
