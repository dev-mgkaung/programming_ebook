import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/constraints.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu,color: Colors.white,),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text("Perfect Project Structure"),
          ),
        ),
      ),
    );
  }
}
