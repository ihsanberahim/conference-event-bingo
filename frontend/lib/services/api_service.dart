import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'http://localhost:8000/api');

  /// Fetch bingo configuration from the backend
  static Future<BingoConfig> getBingoConfig() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/bingo-config'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return BingoConfig.fromJson(data);
      } else {
        throw Exception('Failed to load bingo config: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching bingo config: $e');
    }
  }

  /// Register a user participation
  static Future<void> registerParticipation(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register-participation'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': email,
        }),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception(
            'Failed to register participation: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error registering participation: $e');
    }
  }
}

class BingoConfig {
  final int id;
  final int boardSize;
  final int linesToWin;
  final List<String> activities;

  BingoConfig({
    required this.id,
    required this.boardSize,
    required this.linesToWin,
    required this.activities,
  });

  factory BingoConfig.fromJson(Map<String, dynamic> json) {
    return BingoConfig(
      id: json['id'] ?? 0,
      boardSize: json['board_size'] ?? 4,
      linesToWin: json['lines_to_win'] ?? 4,
      activities: List<String>.from(json['activities'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'board_size': boardSize,
      'lines_to_win': linesToWin,
      'activities': activities,
    };
  }
}
