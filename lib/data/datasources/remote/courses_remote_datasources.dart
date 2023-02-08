import 'package:oddshub/data/datasources/remote/my_client.dart';


class CoursesRemoteDatasources {
  // final HttpClient httpClient;
  // CoursesRemoteDatasources({required this.httpClient});

  Future<void> sendEmailWelcome() async {
    await MyClient.httpClient.post('', 0132, '');
  }
}

