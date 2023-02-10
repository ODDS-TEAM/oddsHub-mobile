import 'package:oddshub/data/entity/registration_user_entity.dart';

abstract class RegistrationEvent {}

class RegistrationInitialEvent extends RegistrationEvent {}

class RegistrationOnPressSaveEvent extends RegistrationEvent {
  final RegistrationUserEntity registrationData;
  RegistrationOnPressSaveEvent(this.registrationData);
}

class RegistrationOnPressCancelEvent extends RegistrationEvent {}
