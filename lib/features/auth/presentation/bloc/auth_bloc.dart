import 'package:blog_app/features/auth/domain/usecases/user_signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;
  AuthBloc({required UserSignup userSignup})
    : _userSignup = userSignup,
      super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final response = await _userSignup(
        UserSignUpParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );
      response.fold(
        (l) => emit(AuthFailure(l.message)), 
        (r) => emit(AuthSuccess(r))
      );
    });
  }
}
