import 'package:flutter/material.dart';
import 'package:lab/main.dart';
import 'package:lab/form.dart';
import 'package:lab/data.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: const Text(
              "Counter_7",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Tambah Budget",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Data Budget",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyDataPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
