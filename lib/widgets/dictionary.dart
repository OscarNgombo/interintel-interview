import 'package:flutter/material.dart';

class MyDictionary extends StatelessWidget {
  MyDictionary({super.key});

  static var dictionary = {
    '34': 'thirty-four',
    '90': 'ninety',
    '91': 'ninety-one',
    '21': 'twenty-one',
    '61': 'sixty-one',
    '9': 'nine',
    '2': 'two',
    '6': 'six',
    '3': 'three',
    '8': 'eight',
    '80': 'eighty',
    '81': 'eighty-one',
    'Ninety-Nine': '99',
    'nine-hundred': '900'
  };

  var sortedKeys = dictionary.values.toList()..sort();

  var sorted = Map.fromEntries(
    dictionary.entries.toList()
      ..sort(
        (e1, e2) => e1.key.compareTo(e2.key),
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: sorted.length,
          itemBuilder: (BuildContext context, int index) {
            String key = sorted.keys.elementAt(index);
            return Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Text(key),
                      title: Text("${sorted[key]}"),
                    ),
                  ),
                  const Divider(
                    height: 2.0,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
