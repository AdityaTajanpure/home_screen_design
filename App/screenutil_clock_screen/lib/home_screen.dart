import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Image.asset(
          'assets/image.png',
          height: MediaQuery.of(context).size.height + 200,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ));
  }
}
