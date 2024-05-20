import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:project_fcii/features/auth/onboarding/view/component/onbording_body.dart';
import 'package:project_fcii/features/auth/onboarding/view/component/onbording_buttons.dart';

class OnbordingPage extends StatelessWidget {
  const OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OnboardingControllerCubit>(
        create: (context) => OnboardingControllerCubit(
            OnboardingControllerState(),
            sharedPreferences: null,
            data: []),
        child:
            BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
          builder: (context, state) {
            OnboardingControllerCubit controller =
                context.read<OnboardingControllerCubit>();
            return Scaffold(
              body: OnboardingBody(
                controller: controller,
              ),
              bottomNavigationBar: OnboardingButton(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
