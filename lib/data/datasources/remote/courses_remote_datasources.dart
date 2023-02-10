import 'package:oddshub/data/datasources/remote/constants.dart';
import 'package:http/http.dart' as http;

class CoursesRemoteDatasources {
  Future<void> sendEmailWelcome() async {
    const courseId = '1';
    final url = Uri.parse(
      '${RemoteDataSourceConstants.baseUrl}/class/$courseId/welcome',
    );
    await http.post(
      url,
    );
  }
}
