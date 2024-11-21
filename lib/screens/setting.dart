import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_mobile/main.dart';
import 'package:travel_app_mobile/blocs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_mobile/screens/edit_profil.dart';
import 'package:travel_app_mobile/screens/widgets/action_dialog.dart';
import 'package:travel_app_mobile/screens/widgets/profile_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  
  void shareApp() {
    Share.share(
      'Découvrez cette application géniale : ',
      subject: 'Partagez notre application !',
    );
  }

  void _changeLanguage(Locale locale) {
    MyApp.of(context)!.setLocale(locale); // Update locale in MyApp
  }

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choisir une langue',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Text("🇫🇷", style: TextStyle(fontSize: 24.sp)),
                title: const Text('Français'),
                trailing: Radio<Locale>(
                  value: const Locale('fr'),
                  groupValue: Localizations.localeOf(context),
                  onChanged: (Locale? value) {
                    if (value != null) {
                      _changeLanguage(value);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              ListTile(
                leading: Text("🇬🇧", style: TextStyle(fontSize: 24.sp)),
                title: const Text('Anglais'),
                trailing: Radio<Locale>(
                  value: const Locale('en'),
                  groupValue: Localizations.localeOf(context),
                  onChanged: (Locale? value) {
                    if (value != null) {
                      _changeLanguage(value);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                'Paramètres',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Option de configuration de l'application",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      icon: Icons.person,
                      title: 'Mon profil',
                      subTitle: 'Consultez votre profil',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(),
                          ),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.language,
                      title: 'Langues',
                      subTitle:
                          Localizations.localeOf(context).languageCode == 'fr'
                              ? 'Français'
                              : 'Anglais',
                      onTap: () => _showLanguageSelector(context),
                    ),
                    ProfileWidget(
                      icon: Icons.share,
                      title: 'Partager l\'application',
                      subTitle: 'Inviter vos amis',
                      onTap: () => shareApp(),
                    ),
                    ProfileWidget(
                      icon: Icons.logout,
                      title: 'Se déconnecter',
                      subTitle: 'Terminer votre session',
                      onTap: () {
                        // Show confirmation dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ActionDialog(
                              icon: Icons.logout,
                              title: 'Confirmation',
                              description:
                                  'Êtes-vous sûr de vouloir vous déconnecter ?',
                              onAcceptPressed: () => {
                                BlocProvider.of<AppBloc>(context)
                                    .add(LoggedOut())
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
