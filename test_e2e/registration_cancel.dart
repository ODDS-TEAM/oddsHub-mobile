import 'package:flutter_test/flutter_test.dart';
import 'pageObject/common_activity.dart';
import 'pageObject/course_list_screen_activity.dart';
import 'pageObject/registration_screen_activity.dart';

void main(List<String> args) {
  CommonActivity.suiteSetUp();

  testWidgets('Cancel registration back to course list', (tester) async {
    final commonActivity = CommonActivity(tester);
    final courseListScreen = CourseListScreenActivity(tester);
    final registrationScreen = RegistrationScreenActivity(tester);
    await commonActivity.openApplication('ODDS');
    await courseListScreen.clickRegisterButton();
    await registrationScreen.clickCancelButton();
    await registrationScreen.showPopUpAndFoundTitlePopUp(
      titleCancel: 'Are you sure you want to discard?',
    );
    await registrationScreen.clickDiscardButton();
    courseListScreen.waitUntilTheScreenShowsTitleMessage('ODDS');
  });
}
