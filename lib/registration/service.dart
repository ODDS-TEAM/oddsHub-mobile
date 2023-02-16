import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oddshub/utils/client.dart';

class RegistrationService {
  static Future<void> register(Map<String, dynamic> data) async {
    final res = await http.post(
      Uri.parse('$apiUrl/registration'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode != 200) {
      throw Exception(res.body);
    }
    return;
  }
}
