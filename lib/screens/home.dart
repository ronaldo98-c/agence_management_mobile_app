import '../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_mobile/data/data.dart';
import 'package:travel_app_mobile/models/town.dart';
import 'package:travel_app_mobile/models/reservation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:travel_app_mobile/screens/widgets/reservation_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  final TabController tabController;

  const HomeScreen({super.key, required this.tabController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Reservation> lastReservations = [];
  List<Town> town = [];

  @override
  void initState() {
    town = getTowns();
    lastReservations = getReservations().take(4).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side with avatar and welcome text
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: const NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/005/545/335/small/user-sign-icon-person-symbol-human-avatar-isolated-on-white-backogrund-vector.jpg'), // Use a local image or network image here
                  radius: 20.r,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).hello,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Ronaldo Gantchi',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Right side with icons
            Row(
              children: [
                IconButton(
                  icon: Stack(
                    children: [
                      const Icon(Icons.notifications, color: Colors.black),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 4.r,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ... votre code pour le champ de recherche et autres widgets
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Entrez la réference de la réservation',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Nos destinations",
                style: TextStyle(
                    fontSize: 18.sp,
                    color:  Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 240.h,
                child: ListView.builder(
                  itemCount: town.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TownListTile(
                      label: town[index].label,
                      townName: town[index].name,
                      noOfTours: town[index].noOfTours,
                      rating: town[index].rating,
                      imgUrl: town[index].imgUrl,
                    );
                  },
                ),
              ),
              // ... autres widgets
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                    "Dernieres reservations",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget. tabController.animateTo(1);
                    },
                    child: Text("Voir plus", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, color: Colors.black)),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              // Encapsulez le ListView.builder dans Expanded
              SizedBox(
                height: 300.h, // Définissez une hauteur pour le ListView
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: lastReservations.length,
                  itemBuilder: (context, index) {
                    return ReservationItem(index: index, reservations: lastReservations);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TownListTile extends StatelessWidget {
  final String label;
  final String townName;
  final int noOfTours;
  final double rating;
  final String imgUrl;
  const TownListTile(
      {required this.townName,
      required this.label,
      required this.noOfTours,
      required this.rating,
      required this.imgUrl,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              height: 220.h,
              width: 150.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 200.h,
            width: 150.w,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 8.w, top: 8.h),
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white38),
                        child: const Text(
                          "New",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(bottom: 10.h, left: 8.w, right: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            townName,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "$noOfTours Tours",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                        margin: EdgeInsets.only(bottom: 10.h, right: 8.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 7.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            color: Colors.white38),
                        child: Column(
                          children: [
                            Text(
                              rating.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 20.sp
                            )
                          ],
                        )
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
