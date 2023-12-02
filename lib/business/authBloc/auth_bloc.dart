import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skill_test_project/data/secure_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String Token = '';
  AuthBloc() : super(AuthInitial()) {
    on<LoadToken>((event, emit) async {
      await SecureStroage().storeData(key: 'Token', value: event.token);
      Token = event.token;
      emit(AuthLoaded(Token: event.token));
    });
    on<GetToken>((event, emit) async {
      Token = await SecureStroage().readData(key: 'Token');
      if (Token.isNotEmpty) {
        // print('Auth Loaded State Token $Token');
        emit(AuthLoaded(Token: Token));
      } else {
        emit(AuthEmpty());
      }
    });
  }
}
