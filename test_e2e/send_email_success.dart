import 'package:flutter_test/flutter_test.dart';
import 'pageObject/common_activity.dart';
import 'pageObject/course_list_screen_activity.dart';
import 'pageObject/send_email_success_activity.dart';

void main(List<String> args) {
  CommonActivity.suiteSetUp();

  testWidgets('Send Email Successfully', (tester) async {
    final commonActivity = CommonActivity(tester, role: 'trainer');
    final sendEmailSuccessScreen = SendEmailSuccessActivity(tester);
    final courseListScreen = CourseListScreenActivity(tester);
    await commonActivity.openApplication('ODDS');
    await sendEmailSuccessScreen.clickGoToSendEmailButton();
    await sendEmailSuccessScreen.clickSendEmailButton();
    await sendEmailSuccessScreen.foundTextSuccess('Send email success');
    await sendEmailSuccessScreen.clickGoToHomeButton();
    courseListScreen.waitUntilTheScreenShowsTitleMessage('ODDS');
  });
}
