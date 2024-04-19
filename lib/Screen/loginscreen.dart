import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:iamdictive/controller/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.googleAccount.value == null) {
          return buildLoginButton();
        } else {
          return buildProfileView();
        }
      }),
    );
  }

  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.bodyMedium,
        ),
        Text(
          controller.googleAccount.value?.email ?? '',
          style: Get.textTheme.bodyMedium,
        ),
        ActionChip(
          label: const Text('Logout'),
          avatar: const Icon(Icons.logout),
          onPressed: () {
            controller.logout();
          },
        )
      ],
    );
  }

  SingleChildScrollView buildLoginButton() {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.black,
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: ScreenUtil().setHeight(200),
                  // width: ScreenUtil().setWidth(900),
                ),
              ),
              Text("Create an ",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(32),
                      fontWeight: FontWeight.bold)),
              Text("account",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(32),
                      fontWeight: FontWeight.bold)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text("Email"),
                          Divider(
                            height: ScreenUtil().setHeight(30),
                          ),
                          const Text("Password"),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: ScreenUtil().setWidth(200),
                            child: const TextField(
                              autofocus: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white30),
                                    // borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                  // filled: true,
                                  border: UnderlineInputBorder(),
                                  fillColor: Colors.white,
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white30)),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(200),
                            child: TextField(
                              obscureText: controller.lihat.value,
                              autofocus: false,
                              decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white30),
                                    // borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                  // filled: true,
                                  border: const UnderlineInputBorder(),
                                  fillColor: Colors.white,
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(controller.eye.value ??
                                        Icons.visibility_off),
                                    color: Colors.white30,
                                    onPressed: () {
                                      controller.seePassword();
                                    },
                                  ),
                                  labelStyle:
                                      const TextStyle(color: Colors.white30)),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  height: ScreenUtil().setHeight(40),
                  width: ScreenUtil().setWidth(150),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Register",
                    style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: ScreenUtil().setHeight(1),
                      width: ScreenUtil().setWidth(100),
                      color: Colors.white30,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "or sign in with",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(1),
                      width: ScreenUtil().setWidth(100),
                      color: Colors.white30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton.extended(
                  icon: Image.asset(
                    "assets/images/google.png",
                    scale: ScreenUtil().setSp(16),
                  ),
                  label: const Text(
                    'Google',
                  ),
                  backgroundColor: Colors.white30,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    controller.login();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
