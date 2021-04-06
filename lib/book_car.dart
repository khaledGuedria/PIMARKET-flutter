import 'package:flutter/material.dart';

class BookCar extends StatefulWidget {

  //var
  String _image;
  String _make;
  String _model;
  String _description;
  int _quatity;

  //constructor
  BookCar(this._image, this._make, this._model, this._description, this._quatity);

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Booking"),
      ),
      body: ListView(
        children: [
            Image.asset(this.widget._image),
            SizedBox(
              height: 10,
            ),

          Container(
          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Model : " + this.widget._make + " " + this.widget._model),
            SizedBox(
              height: 10,
            ),

            Text("Description : "),
            SizedBox(
              height: 10,
            ),

             Text(this.widget._description),
            SizedBox(
              height: 10,
            ),

            Text("Quantity : " + this.widget._quatity.toString()),
            SizedBox(
              height: 10,
            ),
            ],),
            ),

            Center(
              child: FlatButton(
                child: Text("Book this car"),
                onPressed: () {
                  setState(() {
                    widget._quatity--;
                  });
                },),
            ),
        ],
      ),
    );
  }
}