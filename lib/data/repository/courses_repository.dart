import 'package:oddshub/data/datasources/remote/courses_remote_datasources.dart';

class CoursesRepository {
  final CoursesRemoteDatasources coursesRemoteDatasources;

  CoursesRepository({required this.coursesRemoteDatasources});

  void sendEmailWelcome() {
    return coursesRemoteDatasources.sendEmailWelcome();
  }
}
