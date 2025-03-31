import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('버튼 페이지'),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () => print('Elevated Button'), 
                  child: const Text("Elevated 버튼")),
            ),
            Center(
              child: TextButton(
                  onPressed: () => print('Text Button'),
                  child: const Text("Text 버튼")),
            ),
            Center(
              child: OutlinedButton(
                  onPressed: () => print('Outlined Button'),
                  child: const Text("Outlined 버튼")),
            )
          ],
        ),
      ),
    );
  }
}
