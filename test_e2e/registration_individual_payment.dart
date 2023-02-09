import 'package:flutter_test/flutter_test.dart';
import 'pageObject/common_activity.dart';
import 'pageObject/course_list_screen_activity.dart';
import 'pageObject/registration_screen_activity.dart';

void main() {
  CommonActivity.suiteSetUp();

  testWidgets('Registration individual payment', (tester) async {
    final commonActivity = CommonActivity(tester);
    final courseListScreen = CourseListScreenActivity(tester);
    final registrationScreen = RegistrationScreenActivity(tester);
    
    await commonActivity.openApplication('OddsHub');
    await courseListScreen.clickRegisterButton();
    await registrationScreen.fillInTitle('Nong');
    await registrationScreen.fillInNameAndLastName('Newii', 'Huhu');
    await registrationScreen.fillInEmail('newii@odds.team');
    await registrationScreen.fillInPhoneNumber('0812345678');
  });
}
