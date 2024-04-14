import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 60,
        width: 300,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
