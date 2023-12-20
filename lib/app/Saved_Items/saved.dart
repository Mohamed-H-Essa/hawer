import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../home_pages/home.dart';
import '../settings_pages/settings.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);
  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  // bool _showCheckboxes = true;
  // bool _throwShotAway=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "المحفوظ",
          style: TextStyle(fontSize: 22),
        ),
        leading: const SizedBox(),
        backgroundColor: Constants.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 37),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            children: [
              GestureDetector(
                  onLongPress: () {
                    setState(() {});
                  },
                  child: buildListTile("images/image.png", "List item",
                      "Supporting line text lorem ipsum dolo")),
              const SizedBox(height: 21),
              buildListTile("images/image.png", "List item",
                  "Supporting line text lorem ipsum dolo"),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(image, title, subtitle) {
    return ListTile(
        title: Text(
          title,
          //textDirection: TextDirection.ltr,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 14),
        ),
        leading: Image.asset(image),
        // trailing: _showCheckboxes?Checkbox(value: _throwShotAway,
        //   onChanged: (bool? newValue) {
        //     setState(() {
        //       _throwShotAway = newValue!;
        //     });
        //   },
        // ):Container(),
        focusColor: Colors.grey,
        hoverColor: Colors.grey,
        onTap: () {});
  }
}
