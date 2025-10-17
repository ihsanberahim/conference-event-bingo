import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'services/api_service.dart';

/// Default fallback values
const int defaultBoardSize = 4;
const int defaultLinesToWin = 4;

/// The list of default activities for the BINGO board (fallback).
const List<String> defaultBingoActivities = [
  'Ask a speaker a question',
  'Visit a sponsor booth',
  'Network with someone new',
  'Take a selfie at the event',
  'Attend a session in every track',
  'Collect a piece of swag',
  'Tweet about the conference',
  'Join a breakout session',
  'Find someone with the same first name',
  'Learn about a new open source project',
  'Post a picture of the stage',
  'Talk to someone from another country',
  'Thank a volunteer or organizer',
  'Try the conference coffee',
  'Ask for a demo at a booth',
  'Share your favorite session on social media',
  'Find the conference WiFi password',
  'Take a picture with a speaker',
  'Connect with 5 people on LinkedIn',
  'Fill out the post-event survey',
];

/// Provider for bingo configuration from backend
final bingoConfigProvider = FutureProvider<BingoConfig>((ref) async {
  try {
    return await ApiService.getBingoConfig();
  } catch (e) {
    // Return default config if backend is not available
    return BingoConfig(
      id: 0,
      boardSize: defaultBoardSize,
      linesToWin: defaultLinesToWin,
      activities: defaultBingoActivities,
    );
  }
});

/// Provider for board size
final boardSizeProvider = Provider<int>((ref) {
  final config = ref.watch(bingoConfigProvider);
  return config.when(
    data: (config) => config.boardSize,
    loading: () => defaultBoardSize,
    error: (_, __) => defaultBoardSize,
  );
});

/// Provider for lines to win
final linesToWinProvider = Provider<int>((ref) {
  final config = ref.watch(bingoConfigProvider);
  return config.when(
    data: (config) => config.linesToWin,
    loading: () => defaultLinesToWin,
    error: (_, __) => defaultLinesToWin,
  );
});

/// Provider for bingo activities
final bingoActivitiesProvider = Provider<List<String>>((ref) {
  final config = ref.watch(bingoConfigProvider);
  return config.when(
    data: (config) => config.activities,
    loading: () => defaultBingoActivities,
    error: (_, __) => defaultBingoActivities,
  );
});
