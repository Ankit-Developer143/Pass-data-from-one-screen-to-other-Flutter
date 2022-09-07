import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'app_card.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApi(),
  ));
}

class MyApi extends StatefulWidget {
  const MyApi({Key? key}) : super(key: key);

  @override
  _MyApiState createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  var response;
  late List results = [];

  Future fetchUsers() async {
    var result =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    setState(() {
      var resBody = jsonDecode(result.body);
      results.add(resBody);
    });
    return jsonDecode(result.body);
  }

  @override
  void initState() {
    response = fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Geeks for Geeks"),
        ),
        body: Column(
          children: [
            AppCard(
              jsondata: results,
            )
          ],
        ),
      ),
    );
  }
}
