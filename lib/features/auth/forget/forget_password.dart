import 'package:flutter/material.dart';
import 'package:project_fcii/components/custom_button.dart';
import 'package:project_fcii/components/custom_text_field.dart';
import 'package:project_fcii/features/auth/Reset/reset_password.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xff165a72),
        appBar: AppBar(
          title: const Text('Forget Password'),
          backgroundColor: Colors.brown,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/564x/c3/50/c7/c350c71fc51ba3e0ddb5120997eceeda.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Forgot Your Password ?',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 15),
              const Text(
                'Enter Your E-mail ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                hintText: 'Email',
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ResetPassword();
                  }));
                },
                child: CustomButton(
                  text: 'Continue',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
