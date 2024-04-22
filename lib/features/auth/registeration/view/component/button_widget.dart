import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/core/context_extension.dart';
import 'package:project_fcii/features/auth/Verification/verification.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';
import 'package:project_fcii/features/auth/registeration/controller/cubit/registeration_cubit.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.controller});
  final RegisterationCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: BlocBuilder<RegisterationCubit, RegisterationState>(
            builder: (context, state) {
          RegisterationCubit controller = context.read<RegisterationCubit>();
          return Column(
            children: [
              // SizedBox(
              //   height: context.height / 20,
              // ),
              FilledButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.brown),
                  ),
                  onPressed: () {
                    // to verification
                    controller.onPressedConfirmButton();
                  },
                  child: const Text('Confirm')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ?'),
                  GestureDetector(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.brown,
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.underline,
                        decorationThickness: 5,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return LoginPage();
                      }));
                    },
                  ),
                ],
              ),
            ],
          );
        }));
  }
}
