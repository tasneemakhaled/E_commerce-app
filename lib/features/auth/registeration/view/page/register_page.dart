import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/components/custom_button.dart';
import 'package:project_fcii/components/custom_text_field.dart';
import 'package:project_fcii/features/auth/onboarding/controller/cubit/registration_cubit.dart';
import 'package:project_fcii/features/auth/registeration/view/component/body_widgets.dart';
import 'package:project_fcii/features/auth/registeration/view/component/body_widgets.dart';
import 'package:project_fcii/features/auth/registeration/view/component/button_widget.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';

class RegisterationPage extends StatelessWidget {
  const RegisterationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<RegistrationCubit>(
        create: (context) => RegistrationCubit(),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            final RegistrationCubit Controller =
                context.read<RegistrationCubit>();
            return Scaffold(
              appBar: AppBar(
                title: const Text('Sign Up'),
                backgroundColor: Colors.brown,
              ),
              bottomNavigationBar: Container(
                color: Color(0xff9FAD93),
                child: SizedBox(
                  child: ButtonWidget(
                    Controller: Controller,
                  ),
                  height: 50,
                ),
              ),
              //backgroundColor: Color(0xff165a72),
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/564x/c3/50/c7/c350c71fc51ba3e0ddb5120997eceeda.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                    color: const Color(0xff9FAD93),
                    child: BodyWidgets(
                      Controller: Controller,
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}

//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'SIGNUP',
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     CustomTextField(
//                       hintText: 'Email',
//                     ),
//                     const SizedBox(height: 10),
//                     CustomTextField(
//                       hintText: 'Password',
//                     ),
//                     const SizedBox(height: 10),
//                     CustomButton(
//                       text: 'REGISTER',
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'already have an account?',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(
//                                 builder: (BuildContext context) {
//                               return LoginPage();
//                             }));
//                           },
//                           child: const Text(
//                             '  Login',
//                             style: TextStyle(color: Colors.brown),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ))),
//     );
//   }
// }
