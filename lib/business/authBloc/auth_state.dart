part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoaded extends AuthState {
  final String Token;

  const AuthLoaded({required this.Token});
}

final class AuthEmpty extends AuthState {}
