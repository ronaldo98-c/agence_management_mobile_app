import 'package:flutter/material.dart';
import 'package:travel_app_mobile/constants/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback? onTap;

  const ProfileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child:  GestureDetector(  // Ajout de GestureDetector
        onTap: onTap,  // Appel de onTap
        child: Row(
          children: [
            Container(
                width: 50.w,  // Largeur de la boîte
                height: 40.h,  // Hauteur de la boîte
                decoration: BoxDecoration(
                  color: Colors.blue[50],  // Couleur de fond de la boîte (couleur violette très claire)
                  borderRadius: BorderRadius.circular(25.r)  // Bordures arrondies
                ),
                child: Icon(
                  icon,  // Icône représentant un moniteur
                  color: Colors.blue,  // Couleur de l'icône
                  size: 25.sp,  // Taille de l'icône
                )
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w300, 
                      color: Colors.black,
                      fontSize: 14.sp
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
              size: 16.sp
            )
          ],
        ),
      ),
      
      
    );
  }
}
