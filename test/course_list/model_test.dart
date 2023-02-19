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
        'startDate': '2023-05-29T09:00:00.000+00:00'
      });
    });
    test('date formatted', () {
      final dateFormatted = course.formattedDate;
      expect(dateFormatted, 'May 29, 2023');
    });

    test('date formatted', () {
      final priceFormatted = course.formattedPrice;
      expect(priceFormatted, '฿40,000.00');
    });
  });
}
