import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/presentation/journey/registration/individual_payment/individual_payment_constants.dart';

class IndividualPaymentScreenActivity {
  final WidgetTester tester;

  IndividualPaymentScreenActivity(this.tester);

  Future<void> clickOKButton() async {
    final okButton = find.byKey(IndividualPaymentConstants.okButtonKey);
    expect(okButton, findsOneWidget);
    await tester.tap(okButton);
    await tester.pumpAndSettle();
  }

  Future<void> foundTitleAndTailText(
      {required String title, required String tail}) async {
    final titleText = find.text(title);
    expect(titleText, findsOneWidget);
    final tailText = find.text(tail);
    expect(tailText, findsOneWidget);
    await tester.pumpAndSettle();
  }
}
