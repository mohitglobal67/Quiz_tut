import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app_tutorial/screens/homepage.dart';
import 'package:quiz_app_tutorial/screens/quiz_screen.dart';

import '../models/unitmodel.dart';

class Unitwise extends StatefulWidget {
  Unitwise({super.key, required this.id});

  final String? id;

  @override
  State<Unitwise> createState() => _UnitwiseState(id: id);
}

class _UnitwiseState extends State<Unitwise> {
  _UnitwiseState({required this.id});

  final String? id;
  final List<Product> product = [];
  bool loading = false;

  fetchUsersFromGitHub() async {
    final response = await http
        .get(Uri.parse('http://192.168.1.113:8080/api/v1/user/get-subcat/$id'));
    var responseJson = json.decode(response.body.toString());

    UnitWise homeRepoModel = UnitWise.fromJson(responseJson);

    product.addAll(homeRepoModel.product);
    // options.addAll(homeRepoModel.alluser[1].options);

    setState(() {
      loading = true;
    });
  }

  @override
  void initState() {
    fetchUsersFromGitHub();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: Icon(Icons.arrow_back)),
        title: Text("nwknln"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          for (int i = 0; i < product.length; i++)
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(
                      id: product[i].id,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  product[i].title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
        ],
      ),
    );
  }
}
