import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants.dart';

class OurVision extends StatefulWidget {
  const OurVision({Key? key}) : super(key: key);

  @override
  State<OurVision> createState() => _OurVisionState();
}

class _OurVisionState extends State<OurVision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: const Text(
          "رؤيتنا",
          style: TextStyle(fontSize: 22),
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
            SizedBox(),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
                left: 4,
                right: 4,
              ),
              child: Text(
                "تأهيل المجتمع على التعامل السَّلس والسليم مع متحدثي لغة الاشارة واعطائهم حقوقهم التي تكفل حياة انسانية كريمة تجعل منهم اشخاص قادرين على الاندماج في المجتمع مما يتيح الاستفادة من قدراتهم ومواهبهم وتبادل الثقة بينهم وبين البيئة المحيطة الذي ينتج عنه التنوع في الانتاج والتميّز والإبداع في شتَّى مناحي الحياة",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
