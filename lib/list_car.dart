import 'package:flutter/material.dart';
import 'package:my_app/book_car.dart';


class ListCar extends StatelessWidget {

  //var
  List<CarView> cars = [
          //1
          CarView("Assets/bmw-serie3.jpg", "BMW", "Serie 3", "MAHART 730HP", 33),
          //2
          CarView("Assets/chery-tiggo7.jpg", "Cherry", "Tiggo 7", "MAHART 730HP", 123),
          //3
          CarView("Assets/kia-sportage.jpg", "KIA", "Sportage", "MAHART 730HP", 99),
          //4
          CarView("Assets/peugeot-208.jpg", "Peugeot", "208", "GTI STAGE 1 230HP", 55),
 
      ];

 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return cars[index];
        },
        itemCount: cars.length,
      );
  }

}

class CarView extends StatelessWidget {

  //var
  String _make;
  String _model;
  String _image;

  String _description;
  int _quantity;


  //constructor
  CarView(this._image, this._make, this._model, this._description, this._quantity);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: InkWell(
        onTap: () {

          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
                return BookCar(_image, _make, _model, _description, _quantity);
            },));
          },
          child: Row(
          children: [
            Image.asset(this._image, width: 150,),
            Container(
              margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Column(
                children: [
                    Text(this._make),
                    Text(this._model),
              ],),
            )
        ],),
      ),
      );
  }

}