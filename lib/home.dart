import "package:flutter/material.dart";
import "screens/screens.dart";

class Home extends StatefulWidget {
   const Home({Key? key}) : super(key: key);
    
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;


  final List<Widget> _widgetOptions = const  <Widget>[
    StatusScreen(),
    LightScreen(),
    FanScreen(),
    CameraScreen(),
  ];

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(Icons.loop_rounded)
                : const Icon(Icons.loop_outlined),
            label: "Status",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(Icons.lightbulb)
                : const Icon(Icons.lightbulb_outline),
            label: "Light",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(Icons.support_rounded)
                : const Icon(Icons.support_outlined),
            label: "Fan",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? const Icon(Icons.camera_alt)
                : const Icon(Icons.camera_alt_outlined),
            label: "Camera",
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
