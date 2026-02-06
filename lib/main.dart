import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './style.dart' as style;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: style.theme,
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;

  getData() async {
    var result = await http.get(
      Uri.parse('https://codingapple1.github.io/app/data.json'),
    );
    var result2 = jsonDecode(result.body);
    print(result2);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        actions: [Icon(Icons.add_box_outlined)],
      ),
      body: Center(child: [HomeUI(), Text("Shop")][tab]),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Shop",
          ),
        ],
      ),
    );
  }
}

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (contect, i) {
        return Container(
          width: double.infinity,
          height: 400,
          color: Colors.white38,
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('./assets/a.jpg'),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Like 100"),
                    Text("Nickname"),
                    Text("Comment"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
