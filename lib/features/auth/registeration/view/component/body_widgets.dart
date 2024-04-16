import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_fcii/core/utilis/validator.dart';
import 'package:project_fcii/screens/validation.dart';

class BodyWidgets extends StatelessWidget {
  BodyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator: MyValidation().nameValidate,
          decoration: decoration.copyWith(
            label: Text('Mail'),
            hintText: 'xxxx@gmail.com',
            prefixIcon: const Icon(Icons.mail),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator: MyValidation().nameValidate,
          decoration: decoration.copyWith(
            label: Text('Password'),
            prefixIcon: const Icon(Icons.lock),
          ),
          obscureText: true,
          obscuringCharacter: '*',
        ),
        const SizedBox(
          height: 20,
        ),
      ],
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
