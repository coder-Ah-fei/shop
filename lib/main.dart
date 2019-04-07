import 'package:flutter/material.dart';
import 'package:shop/MainPage.dart';
import 'package:shop/indexPage/indexPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//        title: 'Welcome to Flutter',
        home: new MainPageWidget()
    );
  }
}

class MainPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPageWidget>{

  int _selectedIndex = 0;
  final _widgetOptions = [
    IndexPage(),
    MainPage(),
    MainPage(),
    MainPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text('分类')),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('购物车')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.red[400],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}