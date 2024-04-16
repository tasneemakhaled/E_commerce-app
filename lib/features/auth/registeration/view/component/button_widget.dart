import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_fcii/features/auth/login/login_page.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // FilledButton(
        //   style: const ButtonStyle(
        //     backgroundColor: MaterialStatePropertyAll(Colors.brown),
        //   ),
        //   onPressed: (){
        //      // to verification
        // }, child:const  Text('Confirm')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account ?'),
            GestureDetector(
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.brown,
                  decorationStyle: TextDecorationStyle.solid,
                  decoration: TextDecoration.underline,
                  decorationThickness: 5,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return LoginPage();
                }));
              },
            ),
          ],
        ),
      ],
    );
  }
}
