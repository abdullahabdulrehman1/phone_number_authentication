import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthCodeInitialState extends AuthState {}

class AuthCodeLoadingState extends AuthState {}

class AuthCodeSentState extends AuthState {}

class AuthCodeVerifiedState extends AuthState {}

class AuthCodeLoggedInState extends AuthState {
  final User firebaseuser;

  AuthCodeLoggedInState(this.firebaseuser);
}

class AuthCodLoggedOutState extends AuthState {}

class AuthCodeErrorState extends AuthState {
  final String? error;
  AuthCodeErrorState(this.error);
}
