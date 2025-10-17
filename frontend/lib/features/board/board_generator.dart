import 'dart:math';

List<String> generateBoardItems(
    String seed, List<String> activities, int boardSize) {
  final random = Random(seed.hashCode);
  final shuffledActivities = List<String>.from(activities);
  shuffledActivities.shuffle(random);
  return shuffledActivities.sublist(0, boardSize * boardSize);
}
