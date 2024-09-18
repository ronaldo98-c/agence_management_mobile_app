import 'package:flutter/material.dart';
import 'package:travel_app_mobile/helper/dialog_helper.dart';
import 'package:travel_app_mobile/services/base/app_exceptions.dart';

class BaseController {
  void handleError(BuildContext context, error) {
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorDialog(context: context, description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(context: context, description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(context: context, description: "It took longer to respond.");
    } else if (error is InvalidException) {
      DialogHelper.showErrorDialog(context: context, description: error.message, title: "Oops 🥸");
    }
  }
}