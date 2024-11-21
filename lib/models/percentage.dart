class Percentage {
  final String categories;
  final int percent, price;

  const Percentage({
    required this.categories,
    required this.percent,
    required this.price,
  });
}

List<Percentage> getPercentage() {
  List<Percentage> percentage = [
    const Percentage(categories: "Restaurants", percent: 49, price: 1352),
    const Percentage(categories: "Taxi", percent: 25, price: 452),
    const Percentage(categories: "Media", percent: 18, price: 214),
    const Percentage(categories: "Fast food", percent: 8, price: 14),
  ];
  return percentage;
}
