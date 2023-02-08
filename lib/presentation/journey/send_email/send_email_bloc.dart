import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:oddshub/data/datasources/remote/courses_remote_datasources.dart';

part 'send_email_event.dart';
part 'send_email_state.dart';

class SendEmailBloc extends Bloc<SendEmailEvent, SendEmailState> {
  SendEmailBloc() : super(SendEmailInitialState()) {
    on<SendEmailOnPressEvent>((event, emit) async {
      try {
        final CoursesRemoteDatasources coursesRemoteDatasources =
            CoursesRemoteDatasources();
        await coursesRemoteDatasources.sendEmailWelcome();
        emit(SendEmailSuccessState());
      } on Exception {
        emit(SendEmailFailedState());
      }
    });
  }
}
