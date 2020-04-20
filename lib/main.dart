import 'package:deezer/src/pages/favorites/index.dart';
import 'package:deezer/src/pages/musics/index.dart';
import 'package:deezer/src/pages/search/index.dart';
import 'package:deezer/src/pages/shows/index.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _page = index;
          });
        },
        children: <Widget>[Music(), Shows(), Favorites(), Search()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text("Música"),
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            title: Text("Shows"),
            icon: Icon(Icons.mic),
          ),
          BottomNavigationBarItem(
            title: Text("Favoritos"),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text("Busca"),
            icon: Icon(Icons.search),
          ),
        ],
        selectedItemColor: Color(0xffffffff),
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Color(0xff212121),
        currentIndex: _page,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
