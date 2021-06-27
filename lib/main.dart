import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text('Kalender'),
          actions: [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: Text('Sample Text'),
          ),
        ),
      ),
    );
  }
}
