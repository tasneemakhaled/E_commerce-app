import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/core/utilis/validator.dart';
import 'package:project_fcii/features/auth/registeration/controller/cubit/registeration_cubit.dart';
import 'package:project_fcii/features/auth/registeration/view/component/text_name_formatter.dart';
import 'package:project_fcii/screens/validation.dart';

class BodyWidgets extends StatelessWidget {
  BodyWidgets({super.key, required this.controller});
  final RegisterationCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegisterationCubit, RegisterationState>(
        builder: (context, state) {
          RegisterationCubit controller = context.read<RegisterationCubit>();
          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'a-zA-Z')),
                    FilteringTextInputFormatter.deny(RegExp(r'[-]')),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.userNameController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  decoration: decoration.copyWith(
                    suffixIcon: const Icon(Icons.abc),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  inputFormatters: [
                    myAgeTextFueldFormatter(),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.ageController,
                  keyboardType: TextInputType.number,
                  decoration: decoration.copyWith(label: Text('age')),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.mailController,
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
                  controller: controller.passwordController,
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
