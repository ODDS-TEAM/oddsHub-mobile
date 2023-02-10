import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart' as bloc_test;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:oddshub/data/entity/registration_user_entity.dart';
import 'package:oddshub/presentation/journey/Registration/registration_bloc.dart';
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

void main() {
  BaseBlocTest<RegistrationBloc, RegistrationEvent, RegistrationState>().test(
    'should emit state RegistrationSuccessState'
    'when event is RegistrationOnPressSaveEvent',
    build: () {
      return RegistrationBloc();
    },
    act: (bloc) async {
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
      isA<RegistrationSuccessState>,
    ],
  );
}
