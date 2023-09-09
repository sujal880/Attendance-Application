import 'package:attendanceapp/bottom_navigation_bar/bottom_nav_event.dart';
import 'package:attendanceapp/bottom_navigation_bar/bottomnav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Bloc<BottomNavEvent,BottomNavState>{
  BottomNavBloc():super(BottomNavState(tabIndex: 0)){
    on<BottomNavEvent>((event,emit){
      if(event is TabChangeEvent){
        emit(BottomNavInitial(tabIndex: event.tabindex));
      }
    });
  }

}