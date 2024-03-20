import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/models/api_response.dart';

class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    if (kDebugMode) {
      print("ooooo____${apiResponse.error.toString()}");
    }
    if (apiResponse.error is! String &&
        apiResponse.error.errors[0].message == 'Unauthorized.') {
      // back to login and remove data
      // Provider.of<ProfileProvider>(context,listen: false).clearHomeAddress();
      // Provider.of<ProfileProvider>(context,listen: false).clearOfficeAddress();
      // Provider.of<LoginViewModel>(context,listen: false).clearSharedData();
      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AuthScreen()), (route) => false);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      if (kDebugMode) {
        print(errorMessage);
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(errorMessage, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.red));
    }
  }
}
