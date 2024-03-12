import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urella_courier_management_task/controllers/login_controller.dart';
import './main_screen.dart';

import '../../constants/app_color.dart';
import '../widgets/mybutton_widget.dart';
import '../widgets/mytextfield_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),

            // logo
            const Icon(
              Icons.lock_rounded,
              size: 100,
              color: AppColor.secondary,
            ),

            const SizedBox(height: 20),

            // welcome back, you've been missed!
            const Text(
              'Welcome back you\'ve been missed!',
              style: TextStyle(
                color: AppColor.secondary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // username textfield
            MyTextFieldWidget(
              controller: phoneController,
              hintText: 'Phone',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // password textfield
            MyTextFieldWidget(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            // forgot password?
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: AppColor.secondary),
                  ),
                ],
              ),
            ),

            // sign in button
            MyButtonWidget(
              onTap: (){
                var phone = phoneController.text;
                var password = passwordController.text;
                Get.find<LoginController>().login(phone,password);
              },
              title: "Sign In",
              icon: Icons.login,
            ),

            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // not a member? register now
          ],
        ),
      ),
    );
  }
}