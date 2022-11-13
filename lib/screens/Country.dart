import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Map country;
  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(country['name']),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: const [
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Capital'),
              back: Card(
                elevation: 10,
                child: Center(
                  child: Text('hello'),
                ),
              ),
            ),
            CountryCard(title: 'Population'),
            CountryCard(title: 'Flag'),
            CountryCard(title: 'Currency'),
            CountryCard(title: 'Show On Map'),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
