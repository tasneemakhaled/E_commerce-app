import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fcii/components/custom_button.dart';
import 'package:project_fcii/components/custom_text_field.dart';
import 'package:project_fcii/core/utilis/build_context_extension.dart';
import 'package:project_fcii/core/cubit/parent_cubit.dart';
import 'package:project_fcii/features/auth/forget/forget_password.dart';
import 'package:project_fcii/features/auth/registeration/view/page/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParentCubit.instance,
      child: BlocBuilder<ParentCubit, ParentState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Login'.tr,
                  style: context.getTheme.textTheme.displayLarge,
                ),
                backgroundColor: Colors.brown,
              ),
              body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/564x/c3/50/c7/c350c71fc51ba3e0ddb5120997eceeda.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: context.getTheme.textTheme.displayLarge,

                          // style: TextStyle(
                          //   fontSize: 24,
                          //   color: Colors.white,
                          // ),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          hintText: 'Email',
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          hintText: 'Password',
                        ),
                        SizedBox(height: 10),
                        CustomButton(
                          text: 'LOGIN',
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'don\'t have an account?',
                              style: context.getTheme.textTheme.labelLarge,

                              // style: TextStyle(
                              //   color: Colors.white,
                              // ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return RegisterationPage();
                                }));
                              },
                              child: Text(
                                '  SignUp',
                                style: context.getTheme.textTheme.labelLarge,
                              ),
                            ),
                          ],
                        ),
                        Center(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return ForgetPassword();
                            }));
                          },
                          child: Text(
                            'Forget Password ?',
                            style: context.getTheme.textTheme.labelLarge,

                            // style: TextStyle(
                            //   color: Colors.white,
                            // ),
                          ),
                        )),
                      ],
                    ),
                  )));
        },
      ),
    );
  }
}
