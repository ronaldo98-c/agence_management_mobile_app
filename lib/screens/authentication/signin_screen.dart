import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_mobile/blocs/app.dart';
import 'package:travel_app_mobile/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_mobile/screens/widgets/custom_scaffold.dart';
import 'package:travel_app_mobile/screens/authentication/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const routeName = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberPassword = false;
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            bool isLoading = state is LoginLoadingState;
            return CustomScaffold(
                child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(height: 10.h),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formSignInKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Se connecter',
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900,
                                color: lightColorScheme.primary,
                              ),
                            ),
                            SizedBox(height: 40.h),
                            TextFormField(
                              controller: _username,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer votre e-mail';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: const Text('E-mail'),
                                hintText: 'Entrez votre e-mail',
                                hintStyle:
                                    const TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                            SizedBox(height: 25.h),
                            TextFormField(
                              controller: _password,
                              obscureText: true,
                              obscuringCharacter: '*',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer le mot de passe';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: const Text('Mot de passe'),
                                suffixIcon: const Icon(Icons.remove_red_eye),
                                hintText: 'Entrer le mot de passe',
                                hintStyle:
                                    const TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: rememberPassword,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          rememberPassword = value!;
                                        });
                                      },
                                      activeColor: lightColorScheme.primary,
                                    ),
                                    const Text(
                                      'Se souvenir de moi',
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  child: Text(
                                    'Mot de passe oublié?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: lightColorScheme.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        if (_formSignInKey.currentState!
                                            .validate()) {
                                          if (rememberPassword) {
                                            BlocProvider.of<AppBloc>(context)
                                                .add(LoginRequested(
                                                    username: _username.text,
                                                    password: _password.text));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Veuillez accepter le traitement des données personnelles',
                                                ),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white)
                                    : const Text('Se connecter'),
                              ),
                            ),
                            SizedBox(height: 25.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 0.7,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 10.w,
                                  ),
                                  child: const Text(
                                    'Se connecter avec',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 0.7,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Brand(Brands.facebook_f),
                                Brand(Brands.google)
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Je n\'ai pas de compte? ',
                                  style: TextStyle(color: Colors.black45),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (e) => const SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'S\'inscrire',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: lightColorScheme.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
          },
        ),
      ),
    );
  }
}
