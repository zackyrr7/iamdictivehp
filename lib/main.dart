import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamdictive/Screen/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyAupauGTq-RI-PYpHUggVXHWKEPe9DnQ-4',
              appId: '1:153269552102:android:ab17414560b507292c0c27',
              messagingSenderId: '153269552102',
              projectId: 'iamdictive'))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginScreen(),
    );
  }
}
