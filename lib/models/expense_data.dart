class ExpensesData {
  final List<double> data;

  ExpensesData({required this.data});

  factory ExpensesData.fromJson(Map<String, dynamic> json) {
    return ExpensesData(
      data: List<double>.from(json['data'].map((item) => item.toDouble())),
    );
  }
}
