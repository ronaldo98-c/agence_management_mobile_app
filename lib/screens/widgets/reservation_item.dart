import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_mobile/models/reservation.dart';
import 'package:travel_app_mobile/screens/reservation/detail.dart';

class ReservationItem extends StatelessWidget {
  const ReservationItem({
    super.key,
    required this.index,
    required this.reservations
  });

  final int index;
  final List<Reservation> reservations;

  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ReservationDetailScreen(reservationId: reservations[index].reservationId)));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              Container(
                width: 50.w, // Largeur de la boîte
                height: 40.h, // Hauteur de la boîte
                decoration: BoxDecoration(
                  color: Colors.blue[50], // Couleur de fond de la boîte (couleur violette très claire)
                  borderRadius: BorderRadius.circular(25.r), // Bordures arrondies
                ),
                child: Icon(
                  Icons.directions_bus, // Icône représentant un moniteur
                  color: Colors.blue, // Couleur de l'icône
                  size: 25.sp // Taille de l'icône
                )
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reservations[index].state,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14.sp)
                    ),
                    Text(
                      reservations[index].paymentMethod.length > 22
                          ? '${reservations[index].paymentMethod.substring(0, 22)}...' // Limite à 20 caractères
                          : reservations[index].paymentMethod,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 12.sp),// Ajoute des points de suspension
                    )
                  ],
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    reservations[index].totalAmount.toString() + r' XFA',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp)
                  ),
                  Text(
                    reservations[index].createdAt,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
