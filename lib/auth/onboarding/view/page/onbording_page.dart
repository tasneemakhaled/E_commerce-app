import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';

class OnbordingPage extends StatelessWidget {
  const OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Welcome to our App'),
            Expanded(
                child: BlocProvider<OnboardingControllerCubit>(
                    create: (context) => OnboardingControllerCubit(),
                    child: BlocBuilder<OnboardingControllerCubit,
                        OnboardingControllerState>(
                      builder: (context, state) {
                        OnboardingControllerCubit controller = context.read();
                        return PageView(
                            children:
                                List.generate(controller.data.length, (index) {
                          return Column(
                            children: [
                              Image.asset(
                                controller.data[index].image,
                                cacheHeight: 600,
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
        ),
      ),
    );
  }
}
