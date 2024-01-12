import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app_tutorial/models/homemodel.dart';
import 'package:quiz_app_tutorial/screens/subcat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Catagory> catagory = [];
  bool loading = false;

  fetchUsersFromGitHub() async {
    final response = await http.get(
        Uri.parse('http://192.168.1.113:8080/api/v1/category/get-category'));
    var responseJson = json.decode(response.body.toString());

    Homepage homeRepoModel = Homepage.fromJson(responseJson);

    catagory.addAll(homeRepoModel.catagory);
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
        title: Text("nwknln"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          for (int i = 0; i < catagory.length; i++)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => Unitwise(
                        id: catagory[i].id,
                      ),
                    ),
                  );
                },
                child: Text(
                  catagory[i].category.toString(),
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
