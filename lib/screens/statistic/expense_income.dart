import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_mobile/constants/constant.dart';

class ExpenseIncomeData extends StatefulWidget {
  const ExpenseIncomeData({super.key});

  @override
  State<ExpenseIncomeData> createState() => _ExpenseIncomeDataState();
}

class _ExpenseIncomeDataState extends State<ExpenseIncomeData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        expenseIncomeContainer(
          context,
          Icons.arrow_upward,
          "Reservations",
          4100.00,
          Constants.darkBlueColor,
          Colors.white,
        ),
        SizedBox(width: 30.w), 
        expenseIncomeContainer(
          context,
          Icons.arrow_downward,
          "Clients",
          15.15,
          Colors.white,
          Constants.darkBlueColor,
        ),
      ],
    );
  }

  Widget expenseIncomeContainer(BuildContext context, IconData icon,
      String text, double price, Color color, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical : 5.h),
      height: 50.h,
      width: 150.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              icon,
              color: textColor,
          ),
          Column(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 13.sp
                ),
              ),
              Text(
                price.toString(),
                style: TextStyle(
                  color: textColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
