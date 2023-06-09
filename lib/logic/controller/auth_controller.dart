import 'package:e_commerce/models/facebook_model.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxString displayUserName = "".obs;
  RxString disPlayUserPhoto = "".obs;
  RxString disPlayUserEmail = "".obs;
  GoogleSignIn googleSignIn = GoogleSignIn();
  FacebookModel? facebookModel;
  bool isSigedIn = false;
  final GetStorage authBox = GetStorage();
  User? get userProfile => auth.currentUser;
  @override
  void onInit() {
    super.onInit();
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : "")!;
    disPlayUserPhoto.value =
        (userProfile != null ? userProfile!.photoURL : "")!;
    disPlayUserEmail.value = (userProfile != null ? userProfile!.email : "")!;
  }

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpUsingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = "";
      if (e.code == "weak-password") {
        message = "the password provided is too weak.";
      } else if (e.code == "email-already-in-use") {
        message = "the account already exists for that email.";
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName.value = '';
      disPlayUserPhoto.value = '';
      disPlayUserEmail.value = "";
      isSigedIn = false;
      authBox.remove("auth");
      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);
      isSigedIn = true;
      authBox.write('auth', isSigedIn);
      update();
      Get.offAllNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = "";
      if (e.code == "user-not-found") {
        message =
            "Account does not exists for that $email.. Create your account by signing up";
      } else if (e.code == "wrong-password") {
        message = "wrong password provided for that user.";
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = "";
      if (e.code == "user-not-found") {
        message =
            "Account does not exists for that $email.. Create your account by signing up";
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      disPlayUserPhoto.value = googleUser.photoUrl!;
      disPlayUserEmail.value = googleUser.email;
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);
      isSigedIn = true;
      authBox.write('auth', isSigedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void facebookSignUpApp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      facebookModel = FacebookModel.fromJson(data);
      isSigedIn = true;
      authBox.write('auth', isSigedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    }
    final data = await FacebookAuth.instance.getUserData();
    facebookModel = FacebookModel.fromJson(data);
  }
}
