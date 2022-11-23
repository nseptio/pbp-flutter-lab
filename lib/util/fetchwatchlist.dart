import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lab/model/mywatchlist.dart';

Future<List<MyWatchlist>> fetchWatchlist() async {
  var url = Uri.parse('http://mengdjango.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchList
  List<MyWatchlist> watchList = [];
  for (var d in data) {
    if (d != null) {
      watchList.add(MyWatchlist.fromJson(d));
    }
  }

  return watchList;
}
