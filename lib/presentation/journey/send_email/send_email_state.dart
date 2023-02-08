part of 'send_email_bloc.dart';

@immutable
abstract class SendEmailState {}

class SendEmailInitialState extends SendEmailState {}

class SendEmailSuccessState extends SendEmailState {}

class SendEmailFailedState extends SendEmailState {}
