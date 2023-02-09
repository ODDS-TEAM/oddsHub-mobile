import 'package:flutter_test/flutter_test.dart';
import 'pageObject/kw_common.dart';
import 'pageObject/kw_course_list.dart';
import 'pageObject/kw_registration.dart';

void main() {
  suiteSetUp();

  testWidgets('Registration individual payment', (tester) async {
    final registrationPage = RegistrationPage(tester);
    await openApplication(tester, 'OddsHub');
    await registrationPage.clickRegisterButton();
    await registrationPage.fillInTitle('Nong');
    await registrationPage.fillInNameAndLastName('Newii', 'Huhu');
    await registrationPage.fillInEmail('newii@odds.team');
    await registrationPage.fillInPhoneNumber('0812345678');
    await registrationPage.clickSaveButton();
    await registrationPage.clickOKButton();
    waitUntilTheScreenShowsTitleMessage(tester, 'OddsHub');
  });
}
