import 'dart:developer';

import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  _playListCard(String title, String image, [String tracks]) {
    bool _center;

    return Container(
      height: 300,
      margin: EdgeInsets.only(right: 8, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Color(0xff212121),
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(image),
              ),
            ),
            child: Center(
              child: GestureDetector(
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 36,
                  ),
                ),
                onTap: () {
                  log("teste");
                },
              ),
            ),
          ),
          Container(
            width: 160,
            child: Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 18, left: 16, top: 26),
              child: Text(
                "Música",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16, left: 16),
              child: Text(
                "Feito para você",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _playListCard(
                      "Viral Rap", "https://picsum.photos/1920/1080?random=1"),
                  _playListCard(
                      "Lofi mix", "https://picsum.photos/1920/1080?random=2"),
                  _playListCard(
                      "HipHop", "https://picsum.photos/1920/1080?random=3"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
