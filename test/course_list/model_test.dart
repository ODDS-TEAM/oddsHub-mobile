import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/course_list/model.dart';

void main() {
  group('Course model', () {
    late Course course;
    setUp(() {
      course = Course.fromJson({
        'id': 1,
        'classId': 1,
        'name': 'Product Discovery',
        'description': 'Description',
        'image': 'assets/images/courses/product_discovery.png',
        'instructor': 'Jane Makub',
        'price': 40000,
        'startDate': '2023-05-29T09:00:00.000+00:00',
        'people': ClassPeople.fromJson({
          'joined': 20,
          'max': 30,
        })
      });
    });
    test('date formatted', () {
      final dateFormatted = course.formattedDate;
      expect(dateFormatted, '29 May 2023');
    });

    test('date formatted', () {
      final priceFormatted = course.price;
      expect(priceFormatted, '40,000 Baht');
    });

    test('remainder people', () {
      final remainderPeople = course.remainderPeople;
      expect(remainderPeople, '20 / 30 people');
    });
  });
}
