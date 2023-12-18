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
      appBar:
      AppBar(title: const Text ("المحفوظ",style: TextStyle(fontSize: 22),),
        leading: const SizedBox(),
        backgroundColor: Constants.darkBlue,
        actions: [Padding(
          padding: const EdgeInsets.only(left:15.0),
          child: IconButton(icon: const Icon(CupertinoIcons.arrow_left), onPressed: () {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  const Home(),
            ),
          ); },),
        )],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          width: 90,
          color: Constants.darkBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Settings(),
                      ),
                    );
                  },
                  child: Image.asset("images/Settings.png")),
              GestureDetector(
                  onTap: (){
                  },
                  child: Image.asset("images/Bookmark.png")),
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Home(),
                      ),
                    );
                  },
                  child: Image.asset("images/Home.png")),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 37),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            children:[
              GestureDetector(
                onLongPress: (){
               setState(() {
               //_showCheckboxes=true;
                 });
                  },

                  child: buildListTile("images/image.png","List item","Supporting line text lorem ipsum dolo")),
              const SizedBox(height: 21),
              buildListTile("images/image.png", "List item", "Supporting line text lorem ipsum dolo"),
            ],
          ),
        ),
      ),

    );
  }
  ListTile buildListTile(image,title,subtitle) {
    return ListTile(
        title: Text(title,
          //textDirection: TextDirection.ltr,
          style: const TextStyle(color: Colors.black,fontSize: 20),
        ),
        subtitle: Text(subtitle,style: const TextStyle(fontSize: 14),
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
        onTap: () {}
    );
  }

}


