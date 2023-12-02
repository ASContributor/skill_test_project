import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigator_event.dart';
part 'bottom_navigator_state.dart';

class BottomNavigatorBloc
    extends Bloc<BottomNavigatorEvent, BottomNavigatorState> {
  BottomNavigatorBloc()
      : super(const BottomNavigatorInitial(currentIndex: 0, '')) {
    on<BottomNavigatorEvent>((event, emit) {
      if (event is OnTapChange) {
        emit(BottomNavigatorInitial(currentIndex: event.TabIndex, ''));
      }
    });
  }
}
