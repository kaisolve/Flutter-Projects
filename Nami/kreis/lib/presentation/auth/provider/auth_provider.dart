import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/data/models/user_model.dart';
import 'package:kreis/injection.dart';
import 'package:kreis/presentation/auth/otp_screen/otp_screen.dart';
import 'package:kreis/presentation/auth/register_screen/register_screen.dart';
import 'package:kreis/presentation/home_screen/widgets/button_bar.dart';
import 'package:kreis/presentation/widgets/dialogs/scaffold_messanger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController phoneController = TextEditingController();
  TextEditingController smsController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  String phoneCode = '+20';
  String? phone;
  int seconds = 60;
  Timer? timer;
  bool? isTimerStoped;
  bool? isSignedIn;
  String? uId;
  String? verificationId;
  File? image;
  UserModel? userModel;

  void init() {
    isTimerStoped = null;
    timer = null;
    phoneController.clear();
    smsController.clear();
    fNameController.clear();
    lNameController.clear();
    notifyListeners();
  }

  void initOtp(String phone) {
    isTimerStoped = null;
    stopTimer();
    this.phone = phone;
    smsController.clear();
    notifyListeners();
  }

  void startTimer() {
    seconds = 60;
    stopTimer();
    isTimerStoped = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds--;
      notifyListeners();
      if (seconds == 0) {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
      isTimerStoped = true;
      notifyListeners();
    }
  }

  void checkPhoneNumber() {
    phone = phoneController.text.trim();
    if (phone!.length == 10) {
      phone = '+20$phone';
      signInWithPhone(phone!);
      notifyListeners();
    } else if (phone!.length == 11) {
      if (phone!.startsWith("0")) {
        phone = phone!.replaceFirst('0', '');

        phone = '+20$phone';

        signInWithPhone(phone!);
        notifyListeners();
      } else {
        CustomScaffoldMessanger.showScaffoledMessanger(
            title:
                'Phone number must be 10 digits without 0 or 11 digits start with 0'
                    .tr());
      }
    } else {
      CustomScaffoldMessanger.showScaffoledMessanger(
          title:
              'Phone number must be 10 digits without 0 or 11 digits start with 0'
                  .tr());
    }
  }

  void checkSign() async {
    SharedPreferences sharedPreferences = await getIt();

    isSignedIn = sharedPreferences.getBool("is_signed") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("is_signed", true);
    isSignedIn = true;
    notifyListeners();
  }

  void signInWithPhone(String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) async {
          throw Exception(error.message);
        },
        codeSent: (verificationId, forceResendingToken) async {
          this.verificationId = verificationId;
          NavigatorHandler.push(OtpScreen(phone: phoneNumber));
        },
        codeAutoRetrievalTimeout: (verificationId) async {},
      );
    } on FirebaseAuthException catch (e) {
      CustomScaffoldMessanger.showScaffoledMessanger(
          title: e.message.toString());
    }
  }

  void checkSmsCode() {
    String smsCode = smsController.text.trim();
    if (smsCode.length == 6) {
      verifyOtp(verificationId: verificationId!, userOtp: smsCode);
    } else {
      CustomScaffoldMessanger.showScaffoledMessanger(
          title: 'Invalid sms code'.tr());
    }
  }

  void verifyOtp({
    required String verificationId,
    required String userOtp,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User user = (await firebaseAuth.signInWithCredential(credential))
          .user!; // get user and store it in user parameter
      uId = user.uid;
      checkUserIndb();
    } on FirebaseAuthException catch (e) {
      CustomScaffoldMessanger.showScaffoledMessanger(
          title: e.message.toString());
    }
  }

  void checkUserIndb() async {
    try {
      final usersRef = firebaseFirestore.collection('users').doc('id');

      usersRef.get().then((docSnapshot) => {
            if (docSnapshot.exists)
              {NavigatorHandler.pushAndRemoveUntil(const MyHomePage())}
            else
              {NavigatorHandler.pushAndRemoveUntil(const RegisterScreen())}
          });
    } on FirebaseAuthException catch (e) {
      CustomScaffoldMessanger.showScaffoledMessanger(
          title: e.message.toString());
    }
  }

  void storeData() {}

// Firebase & SP Data
  // void storeData() {
  //   UserModel userModel = UserModel(
  //       fname: fNameController.text.trim(),
  //       lname: lNameController.text.trim(),
  //       phone: '',
  //       imagePic: '',
  //       uId: '');
  //   if (image != null) {
  //     saveUserToFirebase(userModel: userModel, profilePic: image!);
  //   } else if (lNameController.text == '' || fNameController.text == '') {
  //     CustomScaffoldMessanger.showScaffoledMessanger(
  //         title: 'Please fill fields');
  //   } else {
  //     CustomScaffoldMessanger.showScaffoledMessanger(
  //         title: 'Please Upload Photo');
  //   }
  // }

  // void saveUserToFirebase({
  //   required UserModel userModel,
  //   required File profilePic,
  // }) async {
  //   try {
  //     await storeFileToStorage("profilePic/$uId", profilePic).then((value) {
  //       userModel.imagePic = value;
  //       userModel.phone = firebaseAuth.currentUser!.phoneNumber;
  //       userModel.uId = firebaseAuth.currentUser!.uid;
  //     });
  //     this.userModel = userModel;
  //     await firebaseFirestore
  //         .collection("users")
  //         .doc(uId)
  //         .set(userModel.toJson());
  //     saveUserDataToSP().then(
  //         (value) => NavigatorHandler.pushAndRemoveUntil(const MyHomePage()));
  //   } on FirebaseAuthException catch (e) {
  //     CustomScaffoldMessanger.showScaffoledMessanger(
  //         title: e.message.toString());
  //   }
  // }

  // Future<String> storeFileToStorage(String ref, File file) async {
  //   UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
  //   TaskSnapshot snapshot = await uploadTask;
  //   String downloadUrl = await snapshot.ref.getDownloadURL();
  //   return downloadUrl;
  // }

  // Future saveUserDataToSP() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.setString(
  //       "user_model", jsonEncode(userModel!.toJson()));
  // }

  // Future<UserModel?> getUserDataFromSP() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? userDataJson = sharedPreferences.getString("user_model");
  //   if (userDataJson != null) {
  //     Map<String, dynamic> userDataMap = jsonDecode(userDataJson);
  //     return UserModel.fromJson(userDataMap);
  //   }
  //   return null;
  // }
}
