import 'package:flutter/material.dart';
import 'package:travel_app_mobile/data/data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_mobile/models/reservation.dart';
import 'package:travel_app_mobile/screens/widgets/filter_modal.dart';
import 'package:travel_app_mobile/screens/widgets/reservation_item.dart';


class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Reservation> reservations = getReservations();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    ListTile(
                      title: Text(
                        'Tout vos réservations',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '10 au total',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded( // Utilisez Expanded pour le TextField
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Entrez la réference de la réservation...',
                            prefixIcon: const Icon(Icons.search, color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[200], // Correction ici
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide.none
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 45.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15.r)
                        ),
                        child: IconButton(
                          onPressed: () {
                            FilterModal.showAddModal(context);
                          },
                          icon: const Icon(Icons.filter_list),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: size.height, // Assurez-vous que la hauteur est définie
                    child: ListView.builder(
                      itemCount: reservations.length,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ReservationItem(index: index, reservations: reservations);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
