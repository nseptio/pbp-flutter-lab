import 'package:flutter/material.dart';
import 'package:lab/util/drawer.dart';
import 'package:lab/model/budget.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Budget"),
      ),
      drawer: const DrawerWidget(),
      body: ListView.builder(
        itemCount: Budget.budgetList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(Budget.budgetList[index].judul),
              subtitle: Text(Budget.budgetList[index].nominal.toString()),
              trailing: Text(Budget.budgetList[index].jenis),
            ),
          );
        },
      ),
    );
  }
}
