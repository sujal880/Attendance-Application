import 'package:attendanceapp/pages/signup/bloc/signup_events.dart';
import 'package:attendanceapp/pages/signup/bloc/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<Signup_Events, SignUpStates> {
  SignUpBloc() : super(SignUpStates()) {
    on<EmailEvents>(_emailEvent);
    on<PasswordEvents>(_passwordEvents);
    on<PhoneNumberEvents>(_phoneEvents);
  }
  void _emailEvent(EmailEvents emailEvents, Emitter<SignUpStates> emit) {
    emit(state.copyWith(email: emailEvents.email));
  }

  void _passwordEvents(
      PasswordEvents passwordEvents, Emitter<SignUpStates> emit) {
    emit(state.copyWith(password: passwordEvents.password));
  }

  void _phoneEvents(
      PhoneNumberEvents phoneNumberEvents, Emitter<SignUpStates> emit) {
    emit(state.copyWith(phonenumber: phoneNumberEvents.phonenumber));
  }
}
