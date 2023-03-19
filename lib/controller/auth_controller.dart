import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_master_class/firebase_ref/reference.dart';
import 'package:firebase_master_class/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/home/home_screen.dart';
import '../widgets/dialogs/dialouge_widget.dart';

class AuthController extends GetxController {
  // final FirebaseAuth _aauth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  void onReady() {
    InitAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
  void InitAuth() async {
    await Future.delayed(Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigatetointroduction();
  }

  User? getuser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Get a fresh idToken and save the user to Firestore
      final updatedGoogleAuth = await googleUser?.authentication;
      if (updatedGoogleAuth != null) {
        await saveUser(googleUser!);
      }
      navigatetoHomePage();
      print(userCredential.user!.displayName);
      
    } catch (e) {
      print(e);
    }
  }

  saveUser(GoogleSignInAccount account) {
    print("function is called");
    print(account.email);
    UserRf.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilePic": account.photoUrl
    });
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      navigatetoHomePage();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void navigatetoHomePage() {
    Get.offAllNamed(HomeScreen.routename);
  }

  void navigatetointroduction() {
    Get.offAllNamed("/introduction");
  }

  void ShowLoginAlertDialog() {
    Get.dialog(Dialogs.questionStartDialogue(onTap: () {
      Get.back();
      navigatetoLoginPage();
    }), barrierDismissible: false);
  }

  void navigatetoLoginPage() {
    Get.toNamed(LoginScreen.routename);
  }

  bool isloggedIn() {
    return _auth.currentUser != null;
  }
}
