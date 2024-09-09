import 'package:car_project/pages/list_all_cars.dart';
import 'package:car_project/pages/page_add_car.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //config
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       //  home: AddCar()
            home : ListCars(),
    );
  }
}


/// CRUD : SQLite en lcoal
/// Formulaire: Add, update,delete, listing
/// Gestiondevoiture
///  Matricule: STRING
///  Couleur:
///  Energie: Essence, Gazoil (Radio )
///    (checkbox)
/// option: clim auto, Toit ouvrant, Camera rEcule
/// categorie: ...