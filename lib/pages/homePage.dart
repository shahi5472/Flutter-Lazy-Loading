import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List value;

  int currentMax = 10;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    value = List.generate(10, (index) => "Item : ${index + 1}");

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lazy Loading...."),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemExtent: 80,
        itemBuilder: (BuildContext context, int index) {
          if (index == value.length) {
            return CupertinoActivityIndicator();
          }
          return ListTile(
            title: Text(value[index]),
          );
        },
        itemCount: value.length + 1,
      ),
    );
  }

  void getMoreData() {
    for (int i = currentMax; i < currentMax + 10; i++) {
      value.add("Item : ${i + 1}");
    }

    currentMax = currentMax + 10;

    setState(() {});
  }
}
