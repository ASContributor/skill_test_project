part of 'bottom_navigator_bloc.dart';

sealed class BottomNavigatorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnTapChange extends BottomNavigatorEvent {
  final int TabIndex;

  OnTapChange({required this.TabIndex});
  @override
  List<Object> get props => [TabIndex];
}
