  import 'package:flutter/material.dart';
  import 'package:shared_preferences/shared_preferences.dart';

  class ListPage extends StatefulWidget {
    const ListPage({super.key});
    @override
    State<ListPage> createState() => _ListPageState();
  }

  class _ListPageState extends State<ListPage> {

    List<String> fruits = [];
    final TextEditingController _controller = TextEditingController();


    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFruits();
  }

  void _loadFruits() async {
      final prefs = await SharedPreferences.getInstance();
      final saveData = prefs.getStringList("fruits");
      if (saveData != null ) {
        setState(() {
          fruits = saveData;
        });
      }
  }


  void _saveFruits() async {
    final prefs = await SharedPreferences.getInstance();
    final saveData = prefs.setStringList("fruits",fruits);
    }


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
                          onSubmitted: (value) {
                            final text = value.trim();
                            if (text.isNotEmpty) {
                              setState(() {
                                fruits.add(text);
                                _controller.clear();
                              });
                              _saveFruits();
                            }
                          },
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
                            _saveFruits();
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

                          final TextEditingController _editcontroller = TextEditingController();

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("아이템 수정"),
                                  content: TextField(
                                    controller: _editcontroller,
                                    decoration: const InputDecoration(
                                      hintText: "새로운 이름 입력"
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("취소"),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          final newText = _editcontroller.text.trim();
                                          if (newText.isNotEmpty) {
                                            setState(() {
                                              fruits[index] = newText;
                                             });
                                            _saveFruits();
                                          }
                                        },
                                        child: const Text("저장"),
                                    )
                                  ],
                                );
                              }
                          );

                        },
                        onLongPress: () {
                          final deletedItem = fruits[index];
                          setState(() {
                            fruits.removeAt(index);
                          });
                          _saveFruits();

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