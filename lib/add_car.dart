import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCar extends StatefulWidget {
//constructor
  AddCar();

  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {

  //var
  String _make;
  String _model;
  String _description;
  int _quantity;

  final GlobalKey<FormState> _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
          key: _globalKey,
          child: ListView(
          children: [
            Image.asset("Assets/car-shadow.png"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Make"),
              validator: (value) {
                    if(value.isEmpty)
                      return "Make cannot be empty!";
                  },
              onSaved: (newValue) {
                _make = newValue;
              },
              
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Model"),
                  validator: (value) {
                    if(value.isEmpty)
                      return "Model cannot be empty!";
                  },
              onSaved: (newValue) {
                _model = newValue;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Description"),
              validator: (value) {
                    if(value.isEmpty)
                      return "Description cannot be empty!";
                  },
                  
              onSaved: (newValue) {
                _description = newValue;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Quantity"),
                  validator: (value) {
                    if(value.isEmpty)
                      return "Quantity cannot be empty!";
                  },
                  onSaved: (khaled) {
                    _quantity = int.parse(khaled);
                  },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Add"),
                  onPressed: () {

                    //validator call
                    if(!_globalKey.currentState.validate())
                    return;
                    //get attributes
                  _globalKey.currentState.save();

                  //popup
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                    title: Text("Car Information"),
                    content: Text("Make : "+ _make + "\n Model : " + _model + "\n Description : " + _description + "\n Quantity : " + _quantity.toString()),
                  );
                  },);

                  },
                ),
                RaisedButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    _globalKey.currentState.reset();
                  },
                ),
              ],
            )
          ],
        ),
      );
  }
}
