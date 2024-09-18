import 'package:flutter/material.dart';
import 'package:travel_app_mobile/data/data.dart';
import 'package:travel_app_mobile/constants/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_mobile/models/country_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:travel_app_mobile/models/popular_tours_model.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PopularTourModel> popularTourModels = [];
  List<CountryModel> country = [];
  @override
  void initState() {
    country = getCountrys();
    popularTourModels = getPopularTours();
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
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/005/545/335/small/user-sign-icon-person-symbol-human-avatar-isolated-on-white-backogrund-vector.jpg'), // Use a local image or network image here
                  radius: 20,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back,',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Ronald Hudson',
                      style: TextStyle(
                        fontSize: 16,
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
                  icon: const Icon(Icons.dark_mode_outlined, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Stack(
                    children: [
                      Icon(Icons.notifications, color: Colors.black),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 4,
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
                    hintText: 'Quel est votre destination...',
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
                  itemCount: country.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CountryListTile(
                      label: country[index].label,
                      countryName: country[index].countryName,
                      noOfTours: country[index].noOfTours,
                      rating: country[index].rating,
                      imgUrl: country[index].imgUrl,
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
                  Text(
                    "Voir plus",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color.fromARGB(137, 150, 138, 138)),
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
                  itemCount: popularTourModels.length,
                  itemBuilder: (context, index) {
                    return TransactionItem(
                      icon: Icons.directions_bus,
                      title: popularTourModels[index].title,
                      description: popularTourModels[index].desc,
                      amount: popularTourModels[index].price,
                      date: '16 May 2024',
                      isPositive: false,
                    );
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

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String amount;
  final String date;
  final bool isPositive;

  const TransactionItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.isPositive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Constants.darkBlueColor,
            radius: 20.0,
            child: Icon(
              icon,
              color: Colors.white,
              size: 24.0,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CountryListTile extends StatelessWidget {
  final String label;
  final String countryName;
  final int noOfTours;
  final double rating;
  final String imgUrl;
  const CountryListTile(
      {required this.countryName,
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
                        margin: const EdgeInsets.only(left: 8, top: 8),
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
                            "Thailand",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "18 Tours",
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
                              "4.5",
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
                              size: 20.sp,
                            )
                          ],
                        ))
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
