import 'app_event.dart';
import 'app_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_mobile/constants/message.dart';
import 'package:travel_app_mobile/controllers/login_controller.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final LoginController loginController;
  
  AppBloc({required this.loginController}) : super(UnauthenticatedState()) {
    on<AppStarted>((event, emit) async {
      final bool hasToken = await loginController.hasToken();
      if (hasToken) {
        emit(AuthenticatedState());
      } else {
        emit(UnauthenticatedState());
      }
    });

    on<LoginRequested>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final result = await loginController.login(
          event.username,
          event.password
        );
        if(result != null) {
          await loginController.persistToken(result);
          emit(AuthenticatedState());
        } else {
          debugPrint(AppMessages.unAuthorize);
          emit(const LoginErrorState(AppMessages.unAuthorize));
        }
      } catch (e) {
        emit(const LoginErrorState(AppMessages.unAuthorize));
      }
    });

    on<LoggedOut>((event, emit) async {
      await loginController.deleteToken();
      emit(UnauthenticatedState());
    });
  }
}