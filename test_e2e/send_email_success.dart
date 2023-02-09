import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/presentation/journey/course/course_list_constants.dart';
import 'package:oddshub/presentation/journey/send_email/send_email_constants.dart';

import 'pageObject/common_activity.dart';

void main(List<String> args) {
  CommonActivity.suiteSetUp();

  testWidgets('Send Email Successfully', (tester) async {
    final commonActivity = CommonActivity(tester);
    await commonActivity.openApplication('OddsHub');
    final goToSendEmail = find.byKey(CourseListConstants.sendEmailButtonKey);
    await tester.tap(goToSendEmail);
    await tester.pumpAndSettle();
    final sendButton = find.byKey(SendEmailConstants.sendButtonKey);
    await tester.tap(sendButton);
    await tester.pumpAndSettle();
    final successText = find.text('Send email success');
    expect(successText, findsOneWidget);
  });
}
