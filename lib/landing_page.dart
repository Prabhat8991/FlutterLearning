import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage(this.startScreen, {super.key});

  final void Function() startScreen;

  void onPressed() {
    startScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 200,
          color: const Color.fromARGB(53, 250, 250, 250) ,
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Learn Flutter the fun way",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
            ))
      ],
    ));
  }
}
