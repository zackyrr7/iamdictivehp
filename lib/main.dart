import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iamdictive/Screen/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyAupauGTq-RI-PYpHUggVXHWKEPe9DnQ-4',
              appId: '1:153269552102:android:ab17414560b507292c0c27',
              messagingSenderId: '153269552102',
              projectId: 'iamdictive'))
      : await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'mons',
          // textTheme: const TextTheme(
          //   bodyLarge: TextStyle(color: Colors.white),
          // ).apply(bodyColor: Colors.white, displayColor: Colors.white)),
          textTheme: Typography.whiteCupertino,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
