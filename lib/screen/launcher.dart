import 'package:cometochange/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'profile.dart';
import 'settings.dart';
 
class Launcher extends StatefulWidget {
    static const routeName = '/';
 
    @override
    State<StatefulWidget> createState() {
        return _LauncherState();
    }
}
 
class _LauncherState extends State<Launcher> {
    int _selectedIndex = 0;
    List<Widget> _pageWidget = <Widget>[
        Homepage(),
        Profile(),
        Settings(),
    ];
    List<BottomNavigationBarItem> _menuBar
    = <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.orange[800]),
            title: Text('Home'),
        ),
        
        BottomNavigationBarItem(
            icon: Icon(Icons.people,color: Colors.orange[800]),
            title: Text('Profile'),
        ),
       
        BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Colors.orange[800]),
            title: Text('Settings'),
        ),
    ];
 
    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }
 
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: _pageWidget.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
                items: _menuBar,
                currentIndex: _selectedIndex,
                selectedItemColor: Theme
                    .of(context)
                    .primaryColor,
                unselectedItemColor: Colors.grey,
                onTap: _onItemTapped,
            ),
        );
    }
}