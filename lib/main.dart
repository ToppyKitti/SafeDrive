import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'get_location.dart';
import 'SettingPage.dart';
import 'history.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {
  int _currentIndex = 0;
  late PageController _pageController;
  String app_bar = 'Starting calling taxi';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(app_bar)),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Container(
                  color: Colors.white,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectLocation()),
                        );
                      },
                      child: const Text('Call taxi'),
                    ),
                  )),
              Container(
                child: History(),
              ),
              Container(
                child: SettingPage(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() {
                _pageController.jumpToPage(index);
                String text = '';
                switch (index) {
                  case 0:
                    {
                      text = 'Starting calling taxi';
                    }
                    break;

                  case 1:
                    {
                      text = 'History';
                    }
                    break;
                  case 2:
                    {
                      text = 'More';
                    }
                    break;
                }
                app_bar = text;
              });
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(title: Text("Home"), icon: Icon(Icons.home)),
              BottomNavyBarItem(
                  title: Text("History"), icon: Icon(Icons.article_rounded)),
              BottomNavyBarItem(
                  title: Text("More"), icon: Icon(Icons.more_horiz)),
            ]),
      ),
    );
  }
}
