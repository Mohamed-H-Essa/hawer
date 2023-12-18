import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/Saved_Items/saved.dart';
import '../../core/constants.dart';
class Saved2 extends StatefulWidget {
  const Saved2({Key? key}) : super(key: key);
  @override
  State<Saved2> createState() => _Saved2State();
}

class _Saved2State extends State<Saved2> {
  // bool _showCheckboxes = true;
  // bool _throwShotAway=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text ("المحدد",style: TextStyle(fontSize: 22),),
        centerTitle: true,
        backgroundColor: Constants.darkBlue,
        leading: const Icon(CupertinoIcons.xmark),
        actions: [
          Padding(
          padding: const EdgeInsets.only(left:15.0),
          child: IconButton(icon: const Icon(CupertinoIcons.arrow_left), onPressed: () { Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  const Saved(),
            ),
          ); },)

        )],
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

                  child: buildListTile("images/image.png","List item","Supporting line text lorem...")),
              const SizedBox(height: 21),
              buildListTile("images/image.png", "List item", "Supporting line text lorem..." ),
            ],
          ),
        ),
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
                  onTap: (){},
                  child: Image.asset("images/Delete.png")),
              GestureDetector(
                  onTap: (){},
                  child: Image.asset("images/Edit.png")),
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


