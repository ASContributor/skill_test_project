part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoadToken extends AuthEvent {
  final String token;

  const LoadToken(this.token);
}

class GetToken extends AuthEvent {}
