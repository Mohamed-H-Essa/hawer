import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: const Text(
          "تواصل معنا",
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
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              // height: 34,
              ),
          Padding(
            padding: EdgeInsets.only(
              top: 5,
              left: 4,
              right: 4,
            ),
            child: Text(
              "7awer.support@gmail.com",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
