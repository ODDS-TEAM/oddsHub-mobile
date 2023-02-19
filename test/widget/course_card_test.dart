import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/course_list/model.dart';
import 'package:oddshub/course_list/widgets/course_card.dart';

void main() {
  testWidgets('Display detail of class/course', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CourseCard(
          course: Course(
            1,
            1,
            'Product Discovery',
            'assets/images/courses/product_discovery.png',
            'Description',
            'Jane Makub',
            40000,
            DateTime.parse('2023-06-12'),
          ),
          isTrainer: false,
        ),
      ),
    );
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Product Discovery'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('by Jane Makub'), findsOneWidget);
    expect(find.text('40,000'), findsNothing);
  });
}
