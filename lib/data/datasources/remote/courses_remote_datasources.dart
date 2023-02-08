import 'package:oddshub/data/datasources/remote/my_client.dart';

import 'package:oddshub/data/datasources/remote/constants.dart';

class CoursesRemoteDatasources {
  Future<void> sendEmailWelcome() async {
    const courseId = '1';
    await MyClient.httpClient.post(
      RemoteDataSourceConstants.host,
      RemoteDataSourceConstants.port,
      '/course/$courseId/welcome',
    );
  }
}
