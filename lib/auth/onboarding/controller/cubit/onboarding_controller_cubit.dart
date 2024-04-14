import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_fcii/auth/onboarding/model/onbording_model.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());

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
}
