import 'package:flutter/material.dart';
import 'package:travel_app_mobile/constants/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionDialog extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onAcceptPressed;

  const ActionDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
     required this.onAcceptPressed
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      title: Column(
        children: [
          Icon(
            icon,
            size: 50.sp,
            color: Colors.grey,
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold)
          )
        ],
      ),
      content: Text(
        description,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Annuler' , style: TextStyle(color: Constants.darkGreyColor))
        ),
        TextButton(
          onPressed: () {
            // Action pour "Allow"
            onAcceptPressed();
            Navigator.of(context).pop();
          },
          child: Text('Accepter', style: TextStyle(color: Constants.darkBlueColor))
        ),
      ],
    );
  }
}
