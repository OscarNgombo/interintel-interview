import 'package:flutter/material.dart';

class Design extends StatelessWidget {
  final String? fName;
  final String? sName;
  final int? phone;
  final String? email;
  const Design({super.key, this.fName, this.sName, this.phone, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 212, 226),
      appBar: AppBar(
        title: const Text("Design"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5,
                color: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 64.0, top: 32, bottom: 32),
                  child: Text(
                    "${greeting()} $fName $sName",
                    style: const TextStyle(
                        fontSize: 24,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 10,
                    semanticContainer: true,
                    clipBehavior: Clip.hardEdge,
                    surfaceTintColor: Colors.blueGrey[800],
                    margin: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0, top: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "$fName",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "$sName",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "$phone",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 24,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "$email",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 24,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 30),
                      ]),
                    ),
                  ),
                ),
              ),
              // Container(
              //   width: 300,
              //   height: 300,
              //   color: Colors.redAccent,
              // )
            ]),
      ),
    );
  }
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}
