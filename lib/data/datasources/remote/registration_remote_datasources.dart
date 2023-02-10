import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oddshub/data/datasources/remote/constants.dart';

class RegistrationRemoteDatasources {
  Future<http.Response> submitRegister(
    String title,
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
  ) async {
    final url = Uri.parse('${RemoteDataSourceConstants.baseUrl}/registration');

    final body = jsonEncode({
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phoneNumber,
      'classId': 1,
    });

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
    return response;
  }
}
