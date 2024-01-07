import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/info/presentation/about_us.dart';
import 'package:hawer_app/app/info/presentation/contact_us.dart';
import 'package:hawer_app/app/info/presentation/our_vision.dart';
import 'package:hawer_app/app/info/presentation/usage_conditions.dart';
import '../../core/constants.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "حاوِر",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Constants.darkBlue,
        leading: const SizedBox(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 327,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ),
                  );
                },
                height: 54,
                //elevation: 10,
                color: Constants.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide.none),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "من نحن",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 327,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactUs(),
                    ),
                  );
                },
                height: 54,
                //elevation: 10,
                color: Constants.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide.none),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "تواصل معنا",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 327,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OurVision(),
                    ),
                  );
                },
                height: 54,
                //elevation: 10,
                color: Constants.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide.none),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "رؤيتنا",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 327,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsageConditions(),
                    ),
                  );
                },
                height: 54,
                //elevation: 10,
                color: Constants.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide.none),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "شروط الاستخدام",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
