import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/core/utilis/context_extension.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';
import 'package:project_fcii/features/auth/onboarding/controller/cubit/registration_cubit.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.Controller});

  final RegistrationCubit Controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
        RegistrationCubit Controller = context.read<RegistrationCubit>();

        return Column(
          children: [
            FilledButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.brown),
                ),
                onPressed: () {
                  // to verification
                },
                child: const Text('Confirm')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account ?'),
                SizedBox(
                  width: context.width / 4,
                ),
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
                      return const LoginPage(
                        username: '',
                      );
                    }));
                  },
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
