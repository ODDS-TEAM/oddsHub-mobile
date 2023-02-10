import 'package:flutter_test/flutter_test.dart';
import 'pageObject/common_activity.dart';
import 'pageObject/course_list_screen_activity.dart';
import 'pageObject/individual_payment_screen_activity.dart';
import 'pageObject/registration_screen_activity.dart';

void main() {
  CommonActivity.suiteSetUp();

  testWidgets('Registration individual payment', (tester) async {
    final commonActivity = CommonActivity(tester);
    final courseListScreen = CourseListScreenActivity(tester);
    final registrationScreen = RegistrationScreenActivity(tester);
    final individualPaymentScreen = IndividualPaymentScreenActivity(tester);
    await commonActivity.openApplication('ODDS');
    await courseListScreen.clickRegisterButton();
    await registrationScreen.fillInTitle('Nong');
    await registrationScreen.fillInNameAndLastName('Newii', 'Huhu');
    await registrationScreen.clickCancelButton();
    await registrationScreen.showPopUpAndFoundTitlePopUp(
      titleCancel: 'Are you sure you want to discard?',
    );
    await registrationScreen.clickContinueButton();
    await registrationScreen.fillInEmail('newii@odds.team');
    await registrationScreen.fillInPhoneNumber('0812345678');
    await registrationScreen.clickDoneOnKeyboard();
    await registrationScreen.clickSaveButton();
    await individualPaymentScreen.foundTitleAndTailText(
      title: 'One step ahead!',
      tail: 'Please send the payment slip to this email jane@odds.team',
    );
    await individualPaymentScreen.clickOKButton();
    courseListScreen.waitUntilTheScreenShowsTitleMessage('ODDS');
  });
}
