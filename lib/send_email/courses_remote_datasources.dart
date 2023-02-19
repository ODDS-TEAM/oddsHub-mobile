import 'package:http/http.dart' as http;
import 'package:oddshub/utils/client.dart';

class CoursesRemoteDatasources {
  Future<void> sendEmailWelcome() async {
    const courseId = '1';
    final url = Uri.parse(
      '$apiUrl/class/$courseId/welcome',
    );
    await http.post(
      url,
    );
  }
}
