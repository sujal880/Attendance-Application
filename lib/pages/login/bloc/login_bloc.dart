import 'package:attendanceapp/pages/login/bloc/login_events.dart';
import 'package:attendanceapp/pages/login/bloc/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEmailEvents>(_emailevents);
    on<LoginPasswordEvents>(_passwordevents);
  }

  _emailevents(LoginEmailEvents emailEvents, Emitter<LoginState> emit) {
    emit(state.copyWith(email: emailEvents.email));
  }

  _passwordevents(LoginPasswordEvents passwordEvents, Emitter<LoginState> emit) {
    emit(state.copyWith(password: passwordEvents.password));
  }
}
