import 'package:travel_app_mobile/models/town.dart';
import 'package:travel_app_mobile/models/reservation.dart';

List<Reservation> getReservations() {
  List<Reservation> reservations = [
    Reservation(
        0,
        "Pending",
        "REV-2151545",
        12000,
        "PAID",
        "CASH",
        "10 Mai 2024"
    ) ,
    Reservation(
        1,
        "Pending",
        "REV-2151545",
        12000,
        "PAID",
        "CASH",
        "11 Mai 2024"
    ),
    Reservation(
        2,
        "Pending",
        "REV-2151545",
        12000,
        "PAID",
        "CASH",
        "12 Mai 2024"
    ),
    Reservation(
        3,
        "Pending",
        "REV-2151545",
        12000,
        "PAID",
        "CASH",
        "05 Jun 2024"
    ),
    Reservation(
        4,
        "Pending",
        "REV-2151545",
        12000,
        "PAID",
        "CASH",
        "22 Avr 2024"
    ),
    Reservation(
        5,
        "Pending",
        "REV-2151545",
        12000,
        "PAID",
        "CASH",
        "10 Mai 2024"
    )
  ]; 

  return reservations.isNotEmpty ? reservations : [];
}

List<Town> getTowns() {
    List<Town> towns = [
        Town(
            "Douala" ,
            "New",
            18,
            4.5,
            "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
        ) , 
        Town(
            "Yaounde" ,
            "Sale",
            12,
            4.5,
            "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
        ) ,

        Town(
            "Bafoussam" ,
            "Sale",
            12,
            4.5,
            "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
        ) 
    ];
    return towns;
}