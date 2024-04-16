import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key, required this.controller});
  OnboardingControllerCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Welcome to our App'),
        Expanded(
            child: BlocProvider<OnboardingControllerCubit>.value(
                value: controller,
                child: BlocBuilder<OnboardingControllerCubit,
                    OnboardingControllerState>(
                  builder: (context, state) {
                    OnboardingControllerCubit controller = context.read();
                    return PageView(
                        controller: controller.pageController,
                        children:
                            List.generate(controller.data.length, (index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.data[index].image,
                                cacheHeight: 400,
                                cacheWidth: 400,
                              ),
                              Text(
                                controller.data[index].title,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: controller.data[index].color),
                              ),
                              Text(
                                controller.data[index].subtitle,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        }));
                  },
                ))),
      ],
    );
  }
}
