import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:travel_app_mobile/services/base/base_client.dart';
import 'package:travel_app_mobile/constants/network_constants.dart';
import 'package:travel_app_mobile/services/shared_pref_service.dart';

class AuthService {
  final SharedPrefService _prefService = SharedPrefService();
  final BaseClient _baseClient = BaseClient();

  // !! login method
  Future<String?>login(dynamic object) async {
    try {
      var response = await _baseClient.post(
        NetworkConstants.loginAPI,
        object,
        header: {'Content-Type': "application/json"},
      );
      var result = json.decode(response.body);
      if (result["success"]) {
        debugPrint(result["data"]["token"]);
        final String? token = result["data"]["token"];
        _prefService.userLog(
          id: result["data"]["user"]["id"],
          email: result["data"]["user"]["email"],
        );
        return token;
      }
    } catch (e) {
      debugPrint("Login error: $e");
    }
    return null;
  }
}