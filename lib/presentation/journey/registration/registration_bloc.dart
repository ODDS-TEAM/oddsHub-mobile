import 'package:bloc/bloc.dart';
import 'package:oddshub/data/datasources/remote/registration_remote_datasources.dart';
import 'package:oddshub/data/entity/registration_user_entity.dart';
import 'package:oddshub/presentation/journey/registration/registration_event.dart';
import 'package:oddshub/presentation/journey/registration/registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRemoteDatasources registrationRemoteDatasources;
  RegistrationBloc({
    required this.registrationRemoteDatasources,
  }) : super(RegistrationInitialState()) {
    on<RegistrationOnPressSaveEvent>((event, emit) async {
      try {
        final RegistrationUserEntity data = event.registrationData;
        final response = await registrationRemoteDatasources.submitRegister(
          data.title,
          data.firstName,
          data.lastName,
          data.email,
          data.phoneNumber,
        );
        if (response.statusCode == 200) {
          
          if (response.body == 'FULL') {
            emit(RegistrationFullState());
          }
           emit(RegistrationSuccessState());
        } 
      } on Exception {
        emit(RegistrationFailedState());
      }
    });

    on<RegistrationOnPressCancelEvent>((event, emit) async {
      emit(RegistrationCancelState());
    });
  }
}