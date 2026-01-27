import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // List view
    List<String> names = ["Harsh", "Gupta", "Gautam", "Patrh"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Layout Widgets"),
      ),
      body: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder),
      // body: GridView(
      //   // grid view
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //   ),
      //   children: names
      //       .map(
      //         (name) => Container(
      //           color: Colors.teal,
      //           child: Center(child: Text(name)),
      //         ),
      //       )
      //       .toList(),
      // ),
      // body: ListView.builder(
      //   itemCount: names.length, // specify the length of the list view
      //   itemBuilder: (context,index){
      //     return Container(
      //       margin: EdgeInsets.all(10),
      //       padding: EdgeInsets.all(10),
      //       color: Colors.brown,
      //       child:Text(names[index])
      //       // child:Text("name ${index}")
      //     );
      //   },
      // ),
      // body: Column( // contain no scroll bar bydefault //
      // // but ListView is scrollable
      //   crossAxisAlignment: CrossAxisAlignment.center,// for column it is horizontal cross axis
      //   mainAxisAlignment: MainAxisAlignment.center, // for column it is vertical main axis
      //   children: names.map((name)=>Container(
      //     margin: EdgeInsets.all(10),
      //     padding: EdgeInsets.all(10),
      //     color: Colors.red,
      //     child: Text(name),
      //   )).toList(),
      // ),
    );
  }
}
