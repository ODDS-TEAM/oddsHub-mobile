part of 'send_email_bloc.dart';

@immutable
abstract class SendEmailEvent {}

class SendEmailInitialEvent extends SendEmailEvent {}

class SendEmailOnPressEvent extends SendEmailEvent {}
