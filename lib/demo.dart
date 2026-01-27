import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App navbar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.dangerous),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: const Color.fromARGB(255, 200, 118, 93),
              child: Text("H"),
            ),
            Text(
              'Hello',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text("Hello this is my description...."),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.amberAccent),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Totals"),
                      Text(
                        "680",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(width: 100, height: 100, color: Colors.amberAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
