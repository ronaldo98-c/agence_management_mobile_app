import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_mobile/blocs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_mobile/screens/splash_screen.dart';
import 'package:travel_app_mobile/controllers/login_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController loginController = LoginController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppBloc(loginController: loginController)..add(AppStarted()),
      child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: 'Montserrat-Light',
                  scaffoldBackgroundColor: Colors.white,
                ),
                home: const SplashScreen(),
              ),
          designSize: const Size(360, 640)),
    );
  }
}
