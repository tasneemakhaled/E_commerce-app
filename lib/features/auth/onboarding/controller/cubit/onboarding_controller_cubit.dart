import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:project_fcii/features/auth/onboarding/model/onbording_model.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit(super.initialState);

  get sharedPerferences => null;

  get onChangeToNext => null;

  get pageController => null;

  get data => null;

  Future<void> onCallSkip(BuildContext context) async {
    await sharedPerferences.setBool('onboarding', true);
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const LoginPage(
          username: '',
        ),
      ),
    );
  }

  // OnboardingControllerCubit() : super(OnboardingControllerInitial());
  // PageController pageController = PageController();
  // void onChangeToNext() {
  //   pageController.nextPage(
  //       duration: Duration(seconds: 2), curve: Curves.bounceIn);
  // }

  // void onCallSkip(context) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return LoginPage();
  //   }));
}

List data = [
  OnbordingModel(
      color: Colors.brown,
      image: 'assets/images/image.jpg',
      subtitle: 'First page',
      title: 'First'),
  OnbordingModel(
      color: Colors.green,
      image: 'assets/images/image.jpg',
      subtitle: 'Second Page',
      title: 'Second'),
  OnbordingModel(
      color: Colors.purple,
      image: 'assets/images/image.jpg',
      subtitle: 'Third Page',
      title: 'Third'),
];
