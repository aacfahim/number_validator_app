import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:phone_number_validator/model/json_dummy.dart';
import 'package:phone_number_validator/model/json_model.dart';
import 'package:phone_number_validator/model/json_placeholder.dart';
import 'package:phone_number_validator/service/api_service.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController number = TextEditingController();
  bool isLoaded = false;
  List<JsonModel> numberList = [];
  List<JsonPlaceholder> posts = [];
  List<Users> list = [];

  Map<String, dynamic>? data;

  //14152007986

  @override
  void didChangeDependencies() async {
    data = await ApiService().getNumberData("14152007986");
    setState(() {
      if (data != null) {
        isLoaded = true;
      }
    });
    super.didChangeDependencies();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone Number Validator")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: number,
              decoration: InputDecoration(
                labelText: 'Enter a phone number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  print("numberList $data");
                  data = await ApiService().getNumberData(number.text);
                  setState(() {
                    if (data != null) {
                      isLoaded = true;
                      data;
                    }
                  });
                },
                child: Text("Search")),
            Visibility(
              visible: isLoaded,
              child: Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView(
                    children: [
                      Text("${data!["location"]}"),
                    ],
                  ),
                ),
              ),
              replacement: Text("Nothing found yet"),
            ),
          ],
        ),
      ),
    );
  }
}
