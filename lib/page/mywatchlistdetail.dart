import 'package:flutter/material.dart';
import 'package:lab/model/mywatchlist.dart';
import 'package:lab/util/drawer.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailWatchlistPage extends StatelessWidget {
  const DetailWatchlistPage({super.key, required this.watchlist});

  final MyWatchlist watchlist;

  @override
  Widget build(BuildContext context) {
    String title = watchlist.fields.title;
    double rating = watchlist.fields.rating;
    String review = watchlist.fields.review;
    DateTime releaseDate = watchlist.fields.releaseDate;
    releaseDate = DateTime.parse(releaseDate.toString());
    String formattedDate = DateFormat('MMM dd, yyyy').format(releaseDate);
    bool isWatched = watchlist.fields.watched;

    final reviewLink = Link(
      target: LinkTarget.self,
      uri: Uri.parse(review),
      builder: ((context, followLink) => MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: followLink,
            child: const Text(
              "here",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ))),
    );

    final titleWidget = Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    );

    final releaseDateWidget = Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Text(
              "Release Date: ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              formattedDate,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ));

    final ratingWidget = Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Text(
              "Rating: ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              rating == 0 ? "(belum diberi rating)" : "$rating/5",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ));

    final statusWidget = Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Text(
              "Status: ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              isWatched ? "Watched" : "Not Watched",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ));

    final reviewText = Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Row(
          children: const [
            Text(
              "Review: ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ));

    final reviewWidget = Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Row(children: [
          rating == 0
              ? Row(
                  children: [
                    const Text(
                      "You can see other people's review ",
                      style: TextStyle(fontSize: 18),
                    ),
                    reviewLink
                  ],
                )
              : Expanded(
                  child: Text(
                    review,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
        ]));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          titleWidget,
          releaseDateWidget,
          ratingWidget,
          statusWidget,
          reviewText,
          reviewWidget,
        ],
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
