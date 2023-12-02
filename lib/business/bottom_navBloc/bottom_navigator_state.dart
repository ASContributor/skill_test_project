part of 'bottom_navigator_bloc.dart';

sealed class BottomNavigatorState extends Equatable {
  final int currentIndex;
  const BottomNavigatorState({required this.currentIndex});
  @override
  List<Object> get props => [];
}

final class BottomNavigatorInitial extends BottomNavigatorState {
  final String test;
  const BottomNavigatorInitial(this.test, {required super.currentIndex});
  @override
  List<Object> get props => [currentIndex];
}
