import 'package:flutter/material.dart';
import 'package:my_app/add_car.dart';
import 'package:my_app/list_car.dart';

class BottomNavigation extends StatefulWidget {

  //var
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _uiIndex = 0;
  List<Widget> interfaces = [
            ListCar(),
            AddCar()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menus with bottom nav"),
      ),
      drawer: Drawer(
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                title: Text("Choose an option")
              ),
              ListTile(
                  title: Text("Go to TabBar navigation"),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/"); 
                  },
                ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Car List"
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Add Car"
              )
          ],
          currentIndex: _uiIndex,
          onTap: (int value) {
            setState(() {
              _uiIndex = value;
            });
          },
          ),
      body: interfaces[_uiIndex],
    );
  }
}