// make error page

import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.error,
  });

  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'حدث خطاء ما.\n الرجاء التأكد من صحة الأنترنت لديك والمحاوله مره اخرى',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                // color: Colors.red,
              ),
            ),
            // make button to go back  by pop

            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('العوده'),
            ),
          ],
        ),
      ),
    );
  }
}
