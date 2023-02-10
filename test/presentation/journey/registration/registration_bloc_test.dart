import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart' as bloc_test;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oddshub/data/datasources/remote/registration_remote_datasources.dart';
import 'package:oddshub/data/entity/registration_user_entity.dart';
import 'package:oddshub/presentation/journey/registration/registration_bloc.dart';
import 'package:oddshub/presentation/journey/registration/registration_event.dart';
import 'package:oddshub/presentation/journey/registration/registration_state.dart';

class BaseBlocTest<B extends Bloc<E, S>, E, S> {
  void test(
    String description, {
    required B Function() build,
    required Future<void> Function(B bloc) act,
    Future<void> Function(B bloc)? verify,
    dynamic Function()? expect,
  }) {
    return bloc_test.blocTest(
      description,
      build: build,
      verify: verify,
      act: act,
      expect: expect,
    );
  }
}

class MockRegistrationRemoteDatasource extends Mock
    implements RegistrationRemoteDatasources {}

void main() {
  late RegistrationRemoteDatasources mockRegistrationRemoteDatasource;
  setUp(() {
    mockRegistrationRemoteDatasource = MockRegistrationRemoteDatasource();
  });

  BaseBlocTest<RegistrationBloc, RegistrationEvent, RegistrationState>().test(
    'should emit state RegistrationSuccessState'
    'when event is RegistrationOnPressSaveEvent',
    build: () {
      return RegistrationBloc(
        registrationRemoteDatasources: mockRegistrationRemoteDatasource,
      );
    },
    act: (bloc) async {
      when(
        () => mockRegistrationRemoteDatasource.submitRegister(
          'Miss',
          'Laksa',
          'Angwa',
          'laksa@gmail.com',
          '0898471911',
        ),
      ).thenAnswer((_) async => Response('', 201));

      bloc.add(
        RegistrationOnPressSaveEvent(
          RegistrationUserEntity(
            'Miss',
            'Laksa',
            'Angwa',
            'laksa@gmail.com',
            '0898471911',
          ),
        ),
      );
    },
    expect: () => <dynamic>[
      isA<RegistrationSuccessState>(),
    ],
  );
}
