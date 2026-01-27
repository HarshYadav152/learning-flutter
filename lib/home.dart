import 'package:flutter/material.dart';
import 'package:learningflutter/profile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF0000),
        title: Text("Application build with flutter"),
        centerTitle: true, // make title center
        actions: [
          // comes in the right
          Icon(Icons.home),
          Icon(Icons.heart_broken),
        ],
        leading: CircleAvatar(
          child: Text("N"),
        ), // avatar stylecircle at the left
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink,
            ),
            // child: Image.asset("images/repo.png") // for making image round we have to use clip
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Image.asset("images/repo.png"),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Harsh Yadav")),

          // Image.asset("images/repo.png") // for loading images from local folder
          TextButton(onPressed: () {}, child: Text("Hello")),
          IconButton(
            onPressed: () {
              print("This is clicked");
            }, // handler for take care of button click event
            icon: Icon(Icons.security_update_rounded),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                // .push keep history and we can back to this screen if we use .pushReplacement then no history.
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: Text("Profile page"),
          ),
        ],
      ),
    );
  }
}
