import 'package:car_project/pages/page_add_car.dart';
import 'package:flutter/material.dart';

class MonMenu extends StatefulWidget {
  const MonMenu({super.key});

  @override
  State<MonMenu> createState() => _MonMenuState();
}

class _MonMenuState extends State<MonMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("dhia"),
            accountEmail: Text("dhiaakacem@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(''),
              radius: 5.0,
            ),
          ),
          createItem(context, AddCar(), "Acceuil", "cosnulter dashbord",
              Icons.dashboard),
          createItem(
              context, AddCar(), "Add Car", "Ajouter new car", Icons.add),
          createItem(context, AddCar(), "Liste car", "cosnulter liste des cars",
              Icons.dashboard),
        ],
      ),
    );
  }

  Widget createItem(BuildContext context, dynamic page, String titre,
      String soustitre, IconData uneIcone) {
    return ListTile(
      title: Text(titre),
      subtitle: Text(soustitre),
      leading: Icon(uneIcone),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) => page));
      },
    );
  }
}
