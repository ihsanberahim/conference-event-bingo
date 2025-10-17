import 'dart:convert';
import 'package:crypto/crypto.dart';

String hashEmail(String email) {
  final bytes = utf8.encode(email.trim().toLowerCase());
  final digest = sha256.convert(bytes);
  return base64Url.encode(digest.bytes).substring(0, 12);
}
