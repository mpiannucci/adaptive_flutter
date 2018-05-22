import 'package:flutter/material.dart';
import 'package:adaptive_flutter/adaptive_flutter.dart';

void main() => runApp(new AdaptiveApp());

class AdaptiveApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Adaptive Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveNavBar(
        title: Text(
          "Adaptive Widgets",
          style: TextStyle(
            color: Colors.white
          )
        ),
      ),
      bottomNavigationBar: AdaptiveBottomNavBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer), 
            title: Text("Timer")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            title: Text("Steps")
          )
        ],
        currentIndex: this.currentIndex,
        onTap: (index){
          setState(() {
            this.currentIndex = index;   
          });
        },
      ),
      body: Container(
        color: currentIndex == 0 ? Colors.white : Colors.deepPurple,
        child: Center(
          child: Text("Screen " + currentIndex.toString()),
        ),
      ),
    );
  }
}