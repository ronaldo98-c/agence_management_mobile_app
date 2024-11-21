import 'package:flutter/material.dart';
import 'package:travel_app_mobile/constants/constant.dart';


class ReservationDetailScreen extends StatefulWidget {
  final int reservationId;
  const ReservationDetailScreen({super.key, required this.reservationId});

  @override
  State<ReservationDetailScreen> createState() => _ReservationDetailScreenState();
}

class _ReservationDetailScreenState extends State<ReservationDetailScreen> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  //Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: Constants.darkBlueColor,
          ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildReservationBreakdown(),
          ],
        ),
      ),
    );
  }


  Widget buildReservationBreakdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildReservationRow('Reference', 'lt0215633015'),
        buildReservationRow('Methode de paiement', 'En cash'),
        buildReservationRow('Status de paiement', 'Soldé'),
        buildReservationRow('Avance', '0 Xfa'),
        buildReservationRow('Status de paiement', 'Soldé'),
        const Divider(),
        buildReservationRow('Total', '1500 xfa', isBold: true),
        buildReservationRow('Avec remise', '1000 xfa', isBold: true),
        buildReservationRow('Reste', '0 xfa', isBold: true),
      ],
    );
  }

  Widget buildReservationRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(amount, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
