import 'dart:io';

class CoursesRemoteDatasources {
  final HttpClient httpClient;
  CoursesRemoteDatasources({required this.httpClient});

  Future<void> sendEmailWelcome() async {
    await httpClient.post('', 0132, '');
  }
}
