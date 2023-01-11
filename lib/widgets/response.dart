import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interintel_interview/API/API.dart';
import 'package:interintel_interview/model/todo_model.dart';

class Response extends StatefulWidget {
  const Response({super.key});

  @override
  State<StatefulWidget> createState() => _MyResponseState();
}

class _MyResponseState extends State<Response> {
  // create a list referencing the Modal class
  List<ToDo> listToDo = [];

//creating a private method that collects the response and passes it to the
//list variable defined above
  _getToDo() {
    API.getToDO().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        listToDo = list.map((e) => ToDo.fromJson(e)).toList();
      });
    });
  }

  @override
  void initState() {
    _getToDo();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Response"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: listToDo.length,
          itemBuilder: ((context, index) => Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          listToDo[index].title.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: listToDo[index].completed == true
                            ? const Text(
                                "Complete",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(
                                "Incomplete",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                    const Divider(
                      height: 2.0,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
