import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/presentation/journey/course/course_list_constants.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_constants.dart';

class SendEmailSuccessActivity {
  final WidgetTester tester;
  SendEmailSuccessActivity(this.tester);

  Future<void> clickGoToSendEmailButton() async {
    final goToSendEmail = find.byKey(CourseListConstants.sendEmailButtonKey);
    await tester.tap(goToSendEmail);
    await tester.pumpAndSettle();
  }

  Future<void> clickSendEmailButton() async {
    final sendButton = find.byKey(SendEmailConstants.sendButtonKey);
    await tester.tap(sendButton);
    await tester.pumpAndSettle();
  }

  Future<void> foundTextSuccess(String text) async {
    final successText = find.text(text);
    expect(successText, findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> clickGoToHomeButton() async {
    final goToHomeButton = find.byKey(SendEmailConstants.goToHomeButtonKey);
    await tester.tap(goToHomeButton);
    await tester.pumpAndSettle();
  }
}
