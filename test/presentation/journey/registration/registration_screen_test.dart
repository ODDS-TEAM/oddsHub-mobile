import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oddshub/presentation/journey/Registration/registration_screen.dart';

import '../../../mock/mock_observer.dart';
import '../../../mock/mock_route.dart';

void main() {
  late MockNavigatorObserver mockNavigatorObserver;

  setUpAll(MockRoute.setUp);

  setUp(() => {mockNavigatorObserver = MockNavigatorObserver()});

  Widget prepareWidget() {
    return MaterialApp(
        home: const RegistrationScreen(),
        navigatorObservers: [mockNavigatorObserver]);
  }

  testWidgets(
      'when user pres save button '
      'then navigate to registration success screen',
      (WidgetTester tester) async {
    final widget = prepareWidget();
    final saveButton = find.byKey(const Key('save-button'));

    await tester.pumpWidget(widget);

    verify(() => mockNavigatorObserver.didPush(any(), any()));
    expect(saveButton, findsOneWidget);
  });
}
