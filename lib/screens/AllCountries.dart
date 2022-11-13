import 'package:country_tracker/screens/Country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({super.key});

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  List countries = [];
  List filteredCountries = [];
  bool isSearching = false;

  @override
  void initState() {
    // TODO: implement initState
    getCountries().then((data) {
      setState(() {
        countries = filteredCountries = data;
      });
    });

    super.initState();
  }

  void _filterCountries(value) {
    setState(() {
      filteredCountries =
          (countries.where((country) => country['name'] == 'India')).toList();
    });
  }

  getCountries() async {
    var response = await Dio().get('https://restcountries.com/v2/all');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: !isSearching
            ? const Text('All Countries')
            : TextField(
                onChanged: (value) {
                  _filterCountries(value);
                },
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  hintText: 'Search country here',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
        actions: [
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: filteredCountries.length > 0
            ? ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              Country(filteredCountries[index]),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      margin: const EdgeInsets.all(8),
                      color: Colors.deepPurpleAccent,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  filteredCountries[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              ),
      ),
    );
  }
}
