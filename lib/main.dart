import 'generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_mobile/blocs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app_mobile/screens/splash_screen.dart';
import 'package:travel_app_mobile/controllers/login_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState(); // Ensure MyAppState is public

   static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  Locale _locale = const Locale('fr'); 
  final LoginController loginController = LoginController();

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(loginController: loginController)..add(AppStarted()),
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          locale: _locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Montserrat-Light',
            scaffoldBackgroundColor: Colors.white,
          ),
          localizationsDelegates: const [
            S.delegate, // Delegate for generated localization
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
