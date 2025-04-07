  import 'package:flutter/material.dart';

  class ListPage extends StatefulWidget {
    const ListPage({super.key});

    @override
    State<ListPage> createState() => _ListPageState();
  }

  class _ListPageState extends State<ListPage> {

    final List<String> fruits = ["사과", "바나나", "포도", "딸기", "복숭아"];
    final TextEditingController _controller = TextEditingController();
    final text = "";


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("LIst 예제"),
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: "아이템 입력",
                            border: OutlineInputBorder()
                          ),
                        )
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () {
                          final text = _controller.text.trim();
                          if (text.isNotEmpty) {
                            setState(() {
                              fruits.add(text);
                              _controller.clear();
                            });
                          }
                        },
                        child: const Text("추가")
                    )
                  ],
                ),
              ),
            const Divider(),
            Expanded(
              child: ListView.builder(
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
                        onLongPress: () {
                          final deletedItem = fruits[index];
                          setState(() {
                            fruits.removeAt(index);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$deletedItem를 삭제함!'))
                          );

                        },
                      );
                  }
              ),
            )
          ],
        )
      );
    }
  }