import 'package:travel_app_mobile/models/country_model.dart';
import 'package:travel_app_mobile/models/popular_tours_model.dart';

List<CountryModel> getCountrys() {
    List<CountryModel> country = [
        CountryModel(
            "Thailand" ,
            "New",
            18,
            4.5,
            "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
        ) , 
        CountryModel(
            "Malaysia" ,
            "Sale",
            12,
            4.5,
            "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
        ) ,

        CountryModel(
            "Malaysia" ,
            "Sale",
            12,
            4.5,
            "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
        ) 
    ];
    return country;
}

List<PopularTourModel> getPopularTours() {
  List<PopularTourModel> popularTourModels = [
    PopularTourModel(
        "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500" ,
        "Thailand",
        "10 nights for two/all inclusive" ,
        "\$ 245.50" ,
        4.0
    ) ,
    PopularTourModel(
        "https://images.pexels.com/photos/1658967/pexels-photo-1658967.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
        "Cuba",
        "10 nights for two/all inclusive" ,
        "\$ 245.50" ,
        4.0
    )
  ]; 

  return popularTourModels;
}