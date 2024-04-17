// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/core/utilis/validator.dart';
import 'package:project_fcii/features/auth/onboarding/controller/cubit/registration_cubit.dart';
import 'package:project_fcii/screens/validation.dart';

class BodyWidgets extends StatelessWidget {
  BodyWidgets({super.key, required this.Controller});

  final RegistrationCubit Controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          RegistrationCubit Controller = context.read<RegistrationCubit>();

          return Form(
            key: Controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: Controller.usernameController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Z][a-z]+'))
                  ],
                  decoration: decoration.copyWith(
                    suffixIcon: const Icon(Icons.abc),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: Controller.mailController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  decoration: decoration.copyWith(
                    label: const Text('Mail'),
                    hintText: 'xxxx@gmail.com',
                    prefixIcon: const Icon(Icons.mail),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: Controller.passwordController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  decoration: decoration.copyWith(
                    label: const Text('Password'),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                  obscuringCharacter: '*',
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  InputDecoration decoration = InputDecoration(
    hintText: 'Enter your user name',
    label: const Text('User Name'),
    floatingLabelAlignment: FloatingLabelAlignment.center,
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.brown,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
