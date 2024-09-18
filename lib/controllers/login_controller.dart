import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travel_app_mobile/services/auth_service.dart';
import 'package:travel_app_mobile/controllers/base_controller.dart';
import 'package:travel_app_mobile/services/base/app_exceptions.dart';

class LoginController extends  BaseController {

 // var _loading = false;
  final storage = const FlutterSecureStorage();
  final AuthService _authService = AuthService(); 


//  bool get loading => _loading;

  // validate login form
  bool validate(String email, String password) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    try {
      if ( email == "" || password == "") {
        throw InvalidException("please fill all given inputs !!", false);
      } else {
        if (emailValid) {
          if (password.length >= 8) {
            return true;
          } else {
            throw InvalidException("password must be greater than 8 !!", false);
          }
        } else {
          throw InvalidException("Email is not valid !!", false);
        }
      }
    } catch (e) {
     // handleError(context , e);
      return false;
    }
  }

  Future<String?>login( String email, String password) async {
    
    final valid = validate(email , password);
    if (valid) {
      //_loading = true;
     // await Future.delayed(const Duration(seconds: 2));
      // ? login method
      return await _authService.login(
        {
          "email": email.toString(),
          "password":password.toString(),
        },
      );
    }
    return null;
  }

  Future<void> persistToken(String? token) async{
    storage.write(key: "authToken", value: token);
  }

  Future<bool>hasToken() async{
    String? token = await storage.read(key: "authToken");
    bool result = token != null ? true : false;
    return result;
  }

  Future<void> deleteToken() async{
    await storage.delete(key: "authToken");
  }
}
