import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:project_fcii/features/auth/onboarding/model/onbording_model.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';
import 'package:project_fcii/features/auth/registeration/view/page/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());

  PageController pageController = PageController();

  void onChangeToNext() {
    pageController.nextPage(
        duration: const Duration(microseconds: 250), curve: Curves.linear);
  }

  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('onboarding', true);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const RegisterationPage(),
      ),
    );
  }

//   // OnboardingControllerCubit(super.initialState);

//   // get sharedPerferences => null;
//   final SharedPreferences? sharedPreferences;
//   final PageController pageController = PageController();
//   List<OnbordingModel> data;
//   get onChangeToNext => null;

//   // get pageController => null;

//   // get data => null;
//   OnboardingControllerCubit(OnboardingControllerState onboardingControllerState,
//       {required this.sharedPreferences, required this.data})
//       : super(OnboardingControllerInitial()) {
//     //emit(OnboardingControllerLoaded(data));
//   }
//   Future<void> onCallSkip(BuildContext context) async {
//     await sharedPreferences!.setBool('onboarding', true);
//     Navigator.push(
//       context,
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) => const LoginPage(
//           username: '',
//         ),
//       ),
//     );
//   }

//   // OnboardingControllerCubit() : super(OnboardingControllerInitial());
//   // PageController pageController = PageController();
//   // void onChangeToNext() {
//   //   pageController.nextPage(
//   //       duration: Duration(seconds: 2), curve: Curves.bounceIn);
//   // }

//   // void onCallSkip(context) {
//   //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//   //     return LoginPage();
//   //   }));
// }

  List data = [
    OnbordingModel(
        color: Colors.brown,
        image: 'assets/images/onbording.jpeg',
        subtitle: 'First page',
        title: 'First'),
    OnbordingModel(
        color: Colors.green,
        image: 'assets/images/onbording.jpeg',
        subtitle: 'Second Page',
        title: 'Second'),
    OnbordingModel(
        color: Colors.purple,
        image: 'assets/images/onbording.jpeg',
        subtitle: 'Third Page',
        title: 'Third'),
  ];
}
