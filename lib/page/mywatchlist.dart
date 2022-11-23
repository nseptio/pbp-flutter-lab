import 'package:flutter/material.dart';
import 'package:lab/util/drawer.dart';
import 'package:lab/util/fetchwatchlist.dart';
import 'package:lab/model/mywatchlist.dart';
import 'package:lab/page/mywatchlistdetail.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  late Future _getWatchlist;

  @override
  void initState() {
    _getWatchlist = fetchWatchlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Card watchlistCard(MyWatchlist myWatchlist) {
      Fields fields = myWatchlist.fields;
      return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
              color: fields.watched ? Colors.green : Colors.red, width: 1.5),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          title: Text(myWatchlist.fields.title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          trailing: Checkbox(
            value: fields.watched,
            onChanged: (bool? value) {
              setState(() {
                fields.watched = !fields.watched;
              });
            },
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailWatchlistPage(watchlist: myWatchlist)));
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Watchlist"),
      ),
      drawer: const DrawerWidget(),
      body: FutureBuilder(
          future: _getWatchlist,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada Watchlist :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                List<MyWatchlist> watchList = snapshot.data!;
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      MyWatchlist myWatch = watchList[index];
                      return Container(
                        margin: const EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                        child: watchlistCard(myWatch),
                      );
                    });
              }
            }
          }),
    );
  }
}
