import 'package:attendanceapp/leaves_section/bloc/leaves_events.dart';
import 'package:attendanceapp/leaves_section/bloc/leaves_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeavesBloc extends Bloc<LeavesEvents, LeavesState> {
  LeavesBloc() : super(LeavesState()) {
    on<ReasonEvents>(_reasonevents);
    on<DescriptionEvents>(_descriptionevents);
  }
  _reasonevents(ReasonEvents reasonEvents, Emitter<LeavesState> emit) {
    emit(state.copyWith(reason: reasonEvents.reason));
  }

  _descriptionevents(
      DescriptionEvents descriptionEvents, Emitter<LeavesState> emit) {
    emit(state.copyWith(description: descriptionEvents.description));
  }
}
