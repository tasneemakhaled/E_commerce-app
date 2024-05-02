import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());

  TextEditingController pinCodeController = TextEditingController();
  final String validCode = '55555';
  void onTapConfirm() {
    if (pinCodeController.text == validCode) {
      print("valid");
    } else {
      print("invalid");
    }
  }
}
