import 'package:flutter/material.dart';
import 'package:my_app/add_car.dart';
import 'package:my_app/list_car.dart';

class TabsInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Menu with Tabs"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Cars List",
                icon: Icon(Icons.list),
              ),
              Tab(
                text: "Add Car",
                icon: Icon(Icons.add),
              ),
            ]
            ,),
          ),
        drawer: Drawer(
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                title: Text("Choose an option")
              ),
              ListTile(
                  title: Text("Go to bottom navigation"),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/bottom");
                  },
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListCar(),
            AddCar()
          ],  
      ),
    ));
  }
}