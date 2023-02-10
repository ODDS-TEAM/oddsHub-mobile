import 'package:flutter_test/flutter_test.dart';
import 'pageObject/common_activity.dart';
import 'pageObject/send_email_success_activity.dart';

void main(List<String> args) {
  CommonActivity.suiteSetUp();

  testWidgets('Send Email Successfully', (tester) async {
    final commonActivity = CommonActivity(tester, isTrainer: true);
    final sendEmailSuccessActivity = SendEmailSuccessActivity(tester);
    await commonActivity.openApplication('OddsHub');
    await sendEmailSuccessActivity.clickGoToSendEmailButton();
    await sendEmailSuccessActivity.clickSendEmailButton();
    await sendEmailSuccessActivity.foundTextSuccess('Send email success');
    await sendEmailSuccessActivity.clickGoToHomeButton();
  });
}
