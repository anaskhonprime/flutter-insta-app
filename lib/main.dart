import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';
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
  var map = {'name': 'John', 'age': 20, 'job': 'Developer'};
  var tmp = [];

  getData() async {
    var result = await http.get(
      Uri.parse('https://codingapple1.github.io/app/data.json'),
    );

    setState(() {
      tmp = jsonDecode(result.body);
      print(tmp);
    });
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Upload(),
                ),
              );
            },
            icon: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: Center(child: [HomeUI(tmp: tmp), Text("Shop")][tab]),
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

class HomeUI extends StatefulWidget {
  HomeUI({this.tmp, super.key});
  final tmp;
  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  var scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tmp.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: 3,
      controller: scroll,
      itemBuilder: (context, i) {
        return Container(
          width: double.infinity,
          height: 400,
          color: Colors.white38,
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.network(widget.tmp[i]['image'], fit: BoxFit.cover),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Likes : ${widget.tmp[i]['likes']}'),
                    Text(widget.tmp[i]['user']),
                    Text(widget.tmp[i]['content']),
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

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload"),),
      body: Column(
        children: [
          Text("Upload Page")
        ],
      ),
    );
  }
}
