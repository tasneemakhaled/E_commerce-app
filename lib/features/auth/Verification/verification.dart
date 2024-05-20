import 'package:flutter/material.dart';
import 'package:path/path.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Verification',
            style: Theme.of(context).textTheme.displayLarge,
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
        ));
  }
}
