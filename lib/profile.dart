import 'package:flutter/material.dart';
import 'package:learningflutter/demo.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // simple back button for go back
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Demo()));
          }, child: Text("Go to demo page"))
        ],
      ),
    );
  }
}