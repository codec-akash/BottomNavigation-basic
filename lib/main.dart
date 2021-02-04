import 'package:bottomNavigation/widget/add_widget.dart';
import 'package:bottomNavigation/widget/edit_widget.dart';
import 'package:bottomNavigation/widget/history_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bottom-Navigation",
      theme: ThemeData(
        primaryColor: Colors.blue[600],
        accentColor: Colors.orange,
      ),
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selected = 0;
  List<Widget> bodyWidget = [
    AddWidget(),
    EditWidget(),
    HistoryWidget(),
  ];
  void selectedIndex(val) {
    setState(() {
      _selected = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text("Bottom Navigation"),
      ),
      body: bodyWidget.elementAt(_selected),
      bottomNavigationBar: Container(
        height: 70.0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                label: 'Edit',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
            ],
            currentIndex: _selected,
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.white,
            selectedFontSize: 16.0,
            unselectedFontSize: 12.0,
            onTap: (val) {
              selectedIndex(val);
            },
          ),
        ),
      ),
    );
  }
}
