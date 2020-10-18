import 'package:flutter/material.dart';
import 'package:flutter_Sqflite_example/database_provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sqflite Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
            
                color: Colors.grey,
                onPressed: () async {
                  int i = await DatabaseHelper.instance.insert({
                    DatabaseHelper.columnName: 'Ram Prasd ',
                  });
                  print("the inserted value is $i");
                },
                child: Text("Insert",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
            FlatButton( color: Colors.blue,
                onPressed: () async {
                  List<Map<String, dynamic>> queryRow =
                      await DatabaseHelper.instance.queryAll();
                  print(queryRow);
                },
                child: Text("Query",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
            FlatButton(
                color: Colors.green,
                onPressed: () async {
                  int updateId = await DatabaseHelper.instance.update({
                    DatabaseHelper.columnId: 2,
                    DatabaseHelper.columnName: 'Govinda Neupane'
                  });
                  print(updateId);
                },
                child: Text("Update",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
            FlatButton(
                color: Colors.red,
                onPressed: () async {
                  int rowAffected = await DatabaseHelper.instance.delete(2);
                  print(rowAffected);
                },
                child: Text("Delete",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
