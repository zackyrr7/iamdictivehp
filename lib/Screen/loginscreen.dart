import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iamdictive/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Obx(() {
        if (controller.googleAccount.value == null) {
          return buildLoginButton();
        } else {
          return buildProfileView();
        }
      })),
    );
  }

  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // CircleAvatar(
        //   backgroundImage:
        //       Image.network(controller.googleAccount.value?.photoUrl ?? '')
        //           .image,
        //   radius: 100,
        // ),
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headlineMedium,
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

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      label: const Text('Sign in With Google'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      onPressed: () {
        controller.login();
      },
    );
  }
}
