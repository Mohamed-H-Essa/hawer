import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: const Text(
          "من نحن",
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.end,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: IconButton(
                icon: const Icon(CupertinoIcons.arrow_left),
                onPressed: () {
                  Navigator.pop(context);
                },
              ))
        ],
        leading: const SizedBox(),
        backgroundColor: Constants.darkBlue,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                // height: 7,
                ),
            Padding(
              padding: EdgeInsets.only(
                left: 4,
                right: 4,
              ),
              child: Text(
                "تطبيق حاوِر هو أداة تهدف الى تحقيق التواصل بين متحدثي لغة الاشارة والاخرين من الاشخاص الغير متحدثين بها عن طريق استخدام تقنية التعرف على اشارات اليد وتحوليها الى نصوص مقروءة او مسموعة لتسهل عملية التواصل مع متحدثي لغة الاشارة وايضا توفير هائل للوقت المُستهلك والمجهود في عملية التواصل",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
