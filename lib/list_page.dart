import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  final List<String> fruits = ["사과", "바나나", "포도", "딸기", "복숭아"];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LIst 예제"),
      ),
      body: ListView.builder(
        itemCount: fruits.length,
          itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(fruits[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${fruits[index]}를 선택했어요!'))
              );
            },
          );
          }
      ),
    );
  }
}
