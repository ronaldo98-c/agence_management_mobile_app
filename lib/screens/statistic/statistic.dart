import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_mobile/constants/constant.dart';
import 'package:travel_app_mobile/screens/statistic/bar_chart.dart';
import 'package:travel_app_mobile/screens/statistic/expense_income.dart';


class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  final List itemList = [
    "2024",
    "2023",
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013"
  ];
  
  String? selectedValue = "2024";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView (
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                Text(
                  'Statistics',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: selectedValue,
                    dropdownColor: Colors.black,
                    items: itemList.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                  ),
                ),
              ]),
              SizedBox(
                height: 10.h
              ),
              const ExpenseIncomeData(),
              SizedBox(
                height: 10.h
              ),
              BarChartSample(title: 'Reservation hebdomadaire', jsonString:'expenses_days_data.json', period: Constants.days) ,
              BarChartSample(title: 'Reservation annuelle', jsonString:'expenses_year_data.json', period: Constants.months)
            ],
          ),
        )

      )
    );
  }
}
