import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit() : super(RegisterationInitial());
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void onPressedConfirmButton(context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'Login',
          arguments: [userNameController.text]);
    } else {
      log('invalid inputs');
    }
  }
}


// class RegistrationCubit extends Cubit<RegistrationState> {
//   RegistrationCubit() : super(RegistrationInitial());
//   TextEditingController mailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   void onPressedConfirmButton(BuildContext context) {
//     if (formKey.currentState!.validate()) {
//       Navigator.pushNamed(context, 'Login',
//           arguments: [usernameController.text]);
//     } else {
//       log('invalid inputs' as num);
//     }
//   }
// }
