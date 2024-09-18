import 'package:flutter/material.dart';
import 'package:travel_app_mobile/constants/constant.dart';
import 'package:travel_app_mobile/screens/widgets/profile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
            const SizedBox(
              height: 10,
            ),
            Text(
              'Paramètres',
              style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Options de configuration de l'application",
              style: TextStyle(
                color: Constants.blackColor.withOpacity(.3),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: size.height * .7,
              width: size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileWidget(
                    icon: Icons.person,
                    title: 'Mon profil',
                  ),
                  ProfileWidget(
                    icon: Icons.language,
                    title: 'Langues',
                  ),
                  ProfileWidget(
                    icon: Icons.chat,
                    title: 'FAQs',
                  ),
                  ProfileWidget(
                    icon: Icons.share,
                    title: 'Partager l \'application',
                  ),
                  ProfileWidget(
                    icon: Icons.logout,
                    title: 'Se deconnecter',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
