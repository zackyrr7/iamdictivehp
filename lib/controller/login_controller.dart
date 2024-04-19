import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  var lihat = false.obs;
  dynamic eye = Icons.visibility.obs;
  final _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  // final GoogleSignInAuthentication googleAuth = await _googleSignin.authentication;

  login() async {
    googleAccount.value = await _googleSignin.signIn();
    GoogleSignInAuthentication? googleAuth =
        await googleAccount.value?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);
  }

  logout() async {
    googleAccount.value = await _googleSignin.signOut();
  }

  seePassword() async {
    lihat(!lihat.value);
    if (lihat.isTrue) {
      return eye = Icons.visibility;
    }
    return eye = Icons.visibility_off;
  }
}
