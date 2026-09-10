import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // List view
    List<String> placeData = ["Link 1", "Link 2"];
    List<String> names = ["Holi", "Diwali"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Layout Widgets"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search for any type...",
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: names
                    .map(
                      (e) => Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text(e)),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            Text("All choices"),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.shade100,
                      image: DecorationImage(image: NetworkImage(placeData.map((e)=>Text(e)))),
                      borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text("data",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w100,
                          color: Colors.amber
                        ),)
                      ),
                  );
                }
              ),
              ),
          ],
        ),
      ),
      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     mainAxisSpacing: 2,
      //     crossAxisSpacing: 2,
      //   ),
      //   itemBuilder: (context, index) {
      //     return Container(child: Text(names[index]), color: Colors.red);
      //   },
      // ),
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
