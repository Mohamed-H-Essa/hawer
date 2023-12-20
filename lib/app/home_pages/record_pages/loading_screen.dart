import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(); // The repeat() method makes the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 154,
            ),
            const Column(
              children: [
                Text(
                  "يتم العمل على الفيديو الخاص بك",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "انتظر قليلا و لا تغلق البرنامج.",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 114,
            ),
            RotationTransition(
              turns: _controller,
              child: Image.asset(
                'images/Workflow.png', // Replace with the path to your image
                width: 100.0,
                height: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
