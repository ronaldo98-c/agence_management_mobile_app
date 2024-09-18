import 'package:flutter/material.dart';
import 'package:travel_app_mobile/root.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_mobile/blocs/app.dart';
import 'package:travel_app_mobile/constants/constant.dart';
import 'package:travel_app_mobile/constants/image_constants.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:travel_app_mobile/screens/authentication/signin_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: AppImages.splashScreen,
      nextScreen: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            return const Root();
          } else {
            return const SignInScreen();
          }
        },
      ),
      centered: true,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Constants.darkBlueColor
    );
  }
}
