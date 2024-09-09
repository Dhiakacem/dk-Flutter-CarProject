import 'package:car_project/db/db_service.dart';
import 'package:flutter/material.dart';

import '../widgets/monmenu.dart';


class ListCars extends StatefulWidget {
  const ListCars({super.key});

  @override
  State<ListCars> createState() => _ListCarsState();
}

class _ListCarsState extends State<ListCars> {
  List listecar = [];

  Future readdata() async {
    DataBaseHelper db = await DataBaseHelper.instance;
    List tmp = await db.getallcars() ;
    print(tmp);
    listecar.addAll(tmp);
    setState(() {
      listecar.addAll(tmp);
    });
    return tmp;
  }

  @override
  void initState() {
    readdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Liste des voitures"),
        ),
        drawer: MonMenu(),
        body: ListView.builder(
          itemCount: listecar.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(listecar[index]['mat']),
                subtitle: Text(listecar[index]['couleur']),
              ),
            );
          },
        ));
  }
}

