import 'package:flutter/material.dart';

class CountryMap extends StatelessWidget {
  const CountryMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Google Map'),
      ),
    );
  }
}
