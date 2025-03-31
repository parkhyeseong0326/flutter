import 'package:flutter/material.dart';
import 'package:hello/drawer.dart';

class FlexPage extends StatefulWidget {
  const FlexPage({super.key});

  @override
  State<FlexPage> createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flexible 예제"),
      ),
      drawer: const MyDrawer(),
      body: Row(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                color: Colors.lightBlue,
                height: 200,
              ),
          ),
          Flexible(
            flex: 2,
              child: Container(
                color: Colors.yellow,
              )
          )
        ],
      ),
    );
  }
}

