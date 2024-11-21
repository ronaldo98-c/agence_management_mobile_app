import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_mobile/constants/constant.dart';
import 'package:travel_app_mobile/models/expense_data.dart';

class BarChartSample extends StatefulWidget {
  final String title;
  final String jsonString;
  final List<String> period;

  const BarChartSample({super.key, required this.title, required this.jsonString, required this.period});
  @override
  State<StatefulWidget> createState() => BarChartSampleState();
}

class BarChartSampleState extends State<BarChartSample> {
  late Future<ExpensesData> expensesData;

  @override
  void initState() {
    super.initState();
    // Load simulated JSON data
    expensesData = fetchExpensesData();
  }

  Future<ExpensesData> fetchExpensesData() async {
    // Charger le contenu du fichier JSON
    final String data = await rootBundle.loadString(widget.jsonString);
    
    // Décoder la chaîne JSON en Map
    final Map<String, dynamic> jsonResponse = json.decode(data);
    
    // Convertir en objet ExpensesData
    return ExpensesData.fromJson(jsonResponse);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.black, fontSize: 18.sp)
                  ),
                ),
              ],
            ),
            SizedBox(height: 38.h),
            Expanded(
              child: FutureBuilder<ExpensesData>(
                future: expensesData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Erreur : ${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    return BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 90000,
                        barGroups: snapshot.data!.data.asMap().entries.map((entry) {
                          int index = entry.key;
                          double value = entry.value;
                          return BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(toY: value, color: Constants.darkBlueColor, width: 16.w),
                            ],
                          );
                        }).toList(),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                var style = TextStyle(fontSize: 10.sp);
                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(widget.period[value.toInt() % 12], style: style),
                                );
                              },
                            ),
                          ),
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ), 
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                      ),
                    );
                  }
                  return const Center(child: Text("Pas de données disponibles"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
