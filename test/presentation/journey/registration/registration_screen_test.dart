import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oddshub/data/models/person.dart';
import 'package:oddshub/presentation/journey/registration/__mock__/mock_registration_bloc.dart';
import 'package:oddshub/presentation/journey/registration/registration_bloc.dart';
import 'package:oddshub/presentation/journey/registration/registration_constants.dart';
import 'package:oddshub/presentation/journey/registration/registration_event.dart';
import 'package:oddshub/presentation/journey/registration/registration_screen.dart';
import 'package:oddshub/presentation/journey/registration/registration_state.dart';

import '../../../mock/mock_function.dart';
import '../../../mock/mock_observer.dart';
import '../../../mock/mock_route.dart';

void main() {
  late MockNavigatorObserver mockNavigatorObserver;
  late Function() mockDiscardButtonTap;
  late Function(Person person) mockOnSuccess;

  late RegistrationBloc mockRegistrationBloc;

  setUpAll(() {
    MockRoute.setUp();
    registerFallbackValue(RegistrationEvent);
    registerFallbackValue(RegistrationOnPressCancelEvent());
    registerFallbackValue(RegistrationCancelState());
    registerFallbackValue(RegistrationFullState());
  });

  setUp(
    () => {
      mockRegistrationBloc = MockRegistrationBloc(),
      mockNavigatorObserver = MockNavigatorObserver(),
      mockOnSuccess = MockFunction<Person>().callbackWithArg,
      mockDiscardButtonTap = MockFunction().callback,
    },
  );

  Widget prepareWidget() {
    return MaterialApp(
      home: RegistrationScreen(
        onSuccess: mockOnSuccess,
        registrationBloc: mockRegistrationBloc,
        onTapDiscardButton: mockDiscardButtonTap,
      ),
      navigatorObservers: [mockNavigatorObserver],
    );
  }

  testWidgets(
      'when state is RegistrationSuccessState'
      'when user press save button '
      'then navigate to registration success screen',
      (WidgetTester tester) async {
    when(() => mockRegistrationBloc.state).thenAnswer(
      (_) => RegistrationSuccessState(),
    );
    final widget = prepareWidget();
    final saveButton = find.byKey(const Key('save_button'));

    await tester.pumpWidget(widget);

    verify(() => mockNavigatorObserver.didPush(any(), any()));
    expect(saveButton, findsOneWidget);
  });

  testWidgets(
      'when state is RegistrationCancelState and user press cancel button '
      'then should call RegistrationOnPressCancelEvent',
      (WidgetTester tester) async {
    when(() => mockRegistrationBloc.state).thenAnswer(
      (_) => RegistrationCancelState(),
    );

    final widget = prepareWidget();
    final cancelButton = find.byKey(RegistrationConstants.cancelButtonKey);

    await tester.pumpWidget(widget);
    await tester.tap(cancelButton);
    await tester.pumpAndSettle();

    verify(
      () => mockRegistrationBloc.add(
        any(
          that: predicate<RegistrationOnPressCancelEvent>((event) => true),
        ),
      ),
    ).called(1);
  });

  testWidgets(
      'when user press discard button on cancel dialog'
      'then navigate to home', (WidgetTester tester) async {
    when(() => mockRegistrationBloc.state).thenAnswer(
      (_) => RegistrationCancelState(),
    );

    whenListen(
      mockRegistrationBloc,
      Stream.fromIterable([
        RegistrationCancelState(),
      ]),
    );

    final widget = prepareWidget();
    final cancelButton = find.byKey(RegistrationConstants.cancelButtonKey);
    final cancelDialog = find.byKey(RegistrationConstants.cancelDialogKey);
    final discardButton = find.byKey(RegistrationConstants.discardButtonKey);

    await tester.pumpWidget(widget);
    await tester.tap(cancelButton);
    await tester.pumpAndSettle();
    await tester.tap(discardButton);

    verify(mockDiscardButtonTap).called(1);
    expect(cancelDialog, findsOneWidget);
    expect(cancelButton, findsOneWidget);
  });

  testWidgets(
    'when user press save button'
    'but course is full'
    'then show snackBar error message',
    (WidgetTester tester) async {
      when(() => mockRegistrationBloc.state).thenAnswer(
        (_) => RegistrationFullState(),
      );

      whenListen(
        mockRegistrationBloc,
        Stream.fromIterable([
          RegistrationFullState(),
        ]),
      );

      final widget = prepareWidget();
      final saveButton = find.byKey(const Key('save_button'));
      final fullCourseDialog = find.byKey(
        RegistrationConstants.snackBarErrorMessageKey,
      );

      await tester.pumpWidget(widget);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      expect(fullCourseDialog, findsOneWidget);
      expect(saveButton, findsOneWidget);
    },
  );
}
