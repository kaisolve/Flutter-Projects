import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kreis/core/navigator/navigator.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/models/user_model.dart';
import 'package:kreis/data/repositories/auth_repository.dart';
import 'package:kreis/presentations/auth/otp_screen/otp_screen.dart';
import 'package:kreis/presentations/auth/register_screen/register_screen.dart';
import 'package:kreis/presentations/home_screen/main_app_layout/main_app_layout.dart';
import 'package:kreis/presentations/widgets/dialogs/scaffold_messanger.dart';

class AuthProvider with ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController smsController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController invitationCode = TextEditingController();
  AuthRepository authRepository = AuthRepository();
  Preferences preferences = Preferences();
  String? verificationId;
  int? forceResendingToken;
  bool ischecked = false;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late UserModel userData;
  String phoneCode = '+20';
  String phone = "";
  String? city;
  late int cityId;
  String? image;
  int seconds = 60;
  Timer? timer;
  bool? isTimerStoped;
  bool? isSignedIn;
  bool isCheckingVerivfication = false;

  void setCity(String city) {
    this.city = city;
    notifyListeners();
  }

  void setCityId(int cityId) {
    this.cityId = cityId;
    notifyListeners();
  }

  void init() {
    // isTimerStoped = null;
    // timer = null;
    // phoneController.clear();
    isCheckingVerivfication = false;
    smsController.clear();
    notifyListeners();
  }

  // void initOtp(String phone) {
  //   this.phone = phone;
  //   isTimerStoped = null;
  //   stopTimer();
  //   smsController.clear();
  //   notifyListeners();
  // }

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
    }
  }

  void checkPhoneNumber() {
    phone = phoneController.text.trim();
    notifyListeners();
    if (phone.length == 10) {
      signInWithPhone(phoneCode + phone);
    } else if (phone.length == 11) {
      if (phone.startsWith("0")) {
        phone = phone.replaceFirst('0', '');

        signInWithPhone(phoneCode + phone);
      } else {
        CustomScaffoldMessanger.showScaffoledMessanger(
            title:
                'Phone number must be 10 digits without 0 or 10 digits start with 0'
                    .tr());
      }
    } else {
      CustomScaffoldMessanger.showScaffoledMessanger(
          title:
              'Phone number must be 10 digits without 0 or 10 digits start with 0'
                  .tr());
    }
  }

  void checkSmsCode() async {
    String smsCode = smsController.text.trim();

    if (smsCode.length == 6) {
      verifyOtp(verificationId: verificationId!, userOtp: smsCode);
    } else {
      CustomScaffoldMessanger.showScaffoledMessanger(
          title: 'Invalid sms code'.tr());
    }
  }

  void signInWithPhone(String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        forceResendingToken: forceResendingToken,
        verificationCompleted: (phoneAuthCredential) async {
          firebaseAuth.signInWithCredential(phoneAuthCredential);
          isCheckingVerivfication = true;
        },
        verificationFailed: (error) async {
          throw Exception(error.message);
        },
        codeSent: (verificationId, forceResendingToken) async {
          this.verificationId = verificationId;
          this.forceResendingToken = forceResendingToken;
          NavigatorHandler.push(const OtpScreen());

          // isCheckingVerivfication = false;
          // notifyListeners();
          // otp();
        },
        codeAutoRetrievalTimeout: (verificationId) async {
          // isCheckingVerivfication = false;
          this.verificationId = null;
          notifyListeners();
        },
      );
    } on FirebaseAuthException catch (e) {
      isCheckingVerivfication = false;
      notifyListeners();

      CustomScaffoldMessanger.showScaffoledMessanger(
          title: e.message.toString());
    }
  }

  void verifyOtp({
    required String verificationId,
    required String userOtp,
  }) async {
    try {
      // isCheckingVerivfication = true;
      // notifyListeners();
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      await firebaseAuth.signInWithCredential(credential);
      checkSignIn();
    } on FirebaseAuthException catch (e) {
      CustomScaffoldMessanger.showScaffoledMessanger(
          title: e.message.toString());
    }
  }

  void checkSignIn() async {
    UserAuthResult result = await authRepository.loginUser(phone);
    if (result.success) {
      preferences.saveUserDataToSP(result);
      NavigatorHandler.pushAndRemoveUntil(const MainAppLayout());
    } else {
      NavigatorHandler.pushAndRemoveUntil(const RegisterScreen());
    }
  }

  void register() async {
    UserAuthResult result = await authRepository.registerUser(
      firstName: fNameController.text.trim(),
      lastName: lNameController.text.trim(),
      phoneCode: phoneCode,
      phone: phone,
      image: image,
      invitationCode: invitationCode.text.trim(),
      cityId: cityId,
    );
    if (result.success) {
      preferences.saveUserDataToSP(result);
      NavigatorHandler.pushAndRemoveUntil(const MainAppLayout());
    } else {
      CustomScaffoldMessanger.showScaffoledMessanger(
          title: 'Fill Necessary Fields'.tr());
    }
  }

  void isInvited(bool value) {
    ischecked = value;
    notifyListeners();
  }
}





















  // else if (lNameController.text == '' || fNameController.text == '') {
  //     CustomScaffoldMessanger.showScaffoledMessanger(
  //         title: 'Please fill fields');
  //   }

// Firebase & SP Data

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:kreis/core/navigator/navigator.dart';
// import 'package:kreis/injection.dart';
// import 'package:kreis/presentation/auth/otp_screen/otp_screen.dart';
// import 'package:kreis/presentation/auth/register_screen/register_screen.dart';
// import 'package:kreis/presentation/home_screen/widgets/button_bar.dart';
// import 'package:kreis/presentation/widgets/dialogs/scaffold_messanger.dart';
// import 'package:shared_preferences/shared_preferences.dart';
  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  // final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // void checkPhoneNumber() {
  //   phone = phoneController.text.trim();
  //   if (phone!.length == 10) {
  //     phone = '+20$phone';
  //     signInWithPhone(phone!);
  //     notifyListeners();
  //   } else if (phone!.length == 11) {
  //     if (phone!.startsWith("0")) {
  //       phone = phone!.replaceFirst('0', '');

  //       phone = '+20$phone';

  //       signInWithPhone(phone!);
  //       notifyListeners();
  //     } else {
  //       CustomScaffoldMessanger.showScaffoledMessanger(
  //           title:
  //               'Phone number must be 10 digits without 0 or 11 digits start with 0'
  //                   .tr());
  //     }
  //   } else {
  //     CustomScaffoldMessanger.showScaffoledMessanger(
  //         title:
  //             'Phone number must be 10 digits without 0 or 11 digits start with 0'
  //                 .tr());
  //   }
  // }

  // void checkSign() async {
  //   SharedPreferences sharedPreferences = await getIt();

  //   isSignedIn = sharedPreferences.getBool("is_signed") ?? false;
  //   notifyListeners();
  // }

  // Future setSignIn() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setBool("is_signed", true);
  //   isSignedIn = true;
  //   notifyListeners();
  // }

  // void checkSmsCode() {
  //   String smsCode = smsController.text.trim();
  //   if (smsCode.length == 6) {
  //     verifyOtp(verificationId: verificationId!, userOtp: smsCode);
  //   } else {
  //     CustomScaffoldMessanger.showScaffoledMessanger(
  //         title: 'Invalid sms code'.tr());
  //   }
  // }

  // void signInWithPhone(String phoneNumber) async {
  //   try {
  //     await firebaseAuth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       verificationCompleted: (phoneAuthCredential) async {
  //         await firebaseAuth.signInWithCredential(phoneAuthCredential);
  //       },
  //       verificationFailed: (error) async {
  //         throw Exception(error.message);
  //       },
  //       codeSent: (verificationId, forceResendingToken) async {
  //         this.verificationId = verificationId;
  //         NavigatorHandler.push(OtpScreen(phone: phoneNumber));
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) async {},
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     CustomScaffoldMessanger.showScaffoledMessanger(
  //         title: e.message.toString());
  //   }
  // }

  // void verifyOtp({
  //   required String verificationId,
  //   required String userOtp,
  // }) async {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId, smsCode: userOtp);
  //     User user = (await firebaseAuth.signInWithCredential(credential))
  //         .user!; // get user and store it in user parameter
  //     uId = user.uid;
  //     checkUserIndb();
  //   } on FirebaseAuthException catch (e) {
  //     CustomScaffoldMessanger.showScaffoledMessanger(
  //         title: e.message.toString());
  //   }
  // }

  // void checkUserIndb() async {
  //   try {
  //     final usersRef = firebaseFirestore.collection('users').doc('id');

  //     usersRef.get().then((docSnapshot) => {
  //           if (docSnapshot.exists)
  //             {NavigatorHandler.pushAndRemoveUntil(const MyHomePage())}
  //           else
  //             {NavigatorHandler.pushAndRemoveUntil(const RegisterScreen())}
  //         });
  //   } on FirebaseAuthException catch (e) {
  //     CustomScaffoldMessanger.showScaffoledMessanger(
  //         title: e.message.toString());
  //   }
  // }

  // void storeData() {
  //   UserModel userModel = UserModel(
  //       fname: fNameController.text.trim(),
  //       lname: lNameController.text.trim(),
  //       phone: '',
  //       imagePic: '',
  //       uId: '');
  //   if (image != null) {
  //     saveUserToFirebase(userModel: userModel, profilePic: image!);
  //   }
  // else if (lNameController.text == '' || fNameController.text == '') {
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

