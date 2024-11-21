import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class UnauthenticatedState extends AppState {}

class AuthenticatedState extends AppState {}

class LoginLoadingState extends AppState {}

class LoginErrorState extends AppState {
  final String message;

  const LoginErrorState(this.message);

  @override
  List<Object> get props => [message];
}