import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.deepPurple
            ),
            child: Text(
                '메뉴',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                )
            ),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('홈'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (route) => false
                );
              }
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('설정'),
              onTap: () {
                Navigator.pushNamed(
                    context, "/setting"
                );
              }
          ),
          ListTile(
              leading: const Icon(Icons.info),
              title: const Text('팝업 테스트'),
              onTap: () {
                Navigator.pushNamed(
                    context, "/popup"
                );
              }
          ),
          ListTile(
              leading: const Icon(Icons.display_settings),
              title: const Text('flex 예제'),
              onTap: () {
                Navigator.pushNamed(
                    context, "/flex"
                );
              }
          ),
          ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Image 예제'),
              onTap: () {
                Navigator.pushNamed(
                    context, "/image"
                );
              }
          ),
          ListTile(
              leading: const Icon(Icons.smart_button),
              title: const Text('Button 예제'),
              onTap: () {
                Navigator.pushNamed(
                    context, "/button"
                );
              }
          ),
          ListTile(
              leading: const Icon(Icons.input),
              title: const Text('Input 예제'),
              onTap: () {
                Navigator.pushNamed(
                    context, "/input"
                );
              }
          ),
          ListTile(
              leading: const Icon(Icons.list),
              title: const Text('List 예제'),
              onTap: () {
                Navigator.pushNamed(
                    context, "/list"
                );
              }
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('투두'),
              onTap: () {
                Navigator.pushNamed(
                    context, "/to-do"
                );
              }
          ),
        ],
      ),
    );
  }
}