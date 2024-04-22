import 'package:flutter/material.dart';
import 'package:project_fcii/components/custom_button.dart';
import 'package:project_fcii/components/custom_text_field.dart';

import 'package:project_fcii/features/auth/Verification/verification.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
          backgroundColor: Colors.brown,
        ),

        // backgroundColor: Color(0xff165a72),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/564x/c3/50/c7/c350c71fc51ba3e0ddb5120997eceeda.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomTextField(
                hintText: 'New Password',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Confirm New Password',
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return VerificationPage();
                  }));
                },
                child: CustomButton(
                  text: 'Reset Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ])));
  }
}
