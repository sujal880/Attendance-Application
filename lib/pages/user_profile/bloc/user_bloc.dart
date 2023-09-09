import 'package:attendanceapp/pages/user_profile/bloc/user_events.dart';
import 'package:attendanceapp/pages/user_profile/bloc/user_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvents,UserStates>{
  UserBloc():super(UserStates()){
    on<EmployName>(_empnameevents);
    on<EmployDesicnation>(_empdescevents);
  }

  void _empnameevents(EmployName employName,Emitter<UserStates>emit){
    emit(state.copyWith(empname: employName.empname));
  }

  void _empdescevents(EmployDesicnation employDesicnation,Emitter<UserStates>emit){
    emit(state.copyWith(empdesc: employDesicnation.empdesc));
  }

}