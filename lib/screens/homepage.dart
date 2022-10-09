import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phone_number_validator/model/json_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController number = TextEditingController();

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
            ElevatedButton(onPressed: () {}, child: Text("Search")),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Placeholder();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
