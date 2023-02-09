import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget? child;

  const BackgroundWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: child));
  }
}
