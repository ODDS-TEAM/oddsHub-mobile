import 'package:oddshub/data/repository/courses_repository.dart';

class CoursesUsecase {
  final CoursesRepository coursesRepository;

  CoursesUsecase({required this.coursesRepository});
  Future<void> sendEmailWelcome() async {
    coursesRepository.sendEmailWelcome();
  }
}
