import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../db/db_service.dart';
import '../models/car.dart';
import '../widgets/custom_bouton.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_radioBouton.dart';
import '../widgets/custom_text.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final formkey = GlobalKey<FormState>();
  bool valuecheck1 = false;
  bool valuecheck2 = false;
  String radioSelected = 'E';
  var car = Car();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajout dune nouvelle voitrue"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
      child :Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Column(
            children: [
              //marque : String : taille 9
              CustomTextWidget(
                label: "Matricule",
                hint: "Donner matricule la voiture",
                uneIcone: Icons.car_rental,
                typeclavier: TextInputType.text,
                valider: (String? value) {
                  if (value == null || value.length == 0)
                    return "Matricul est obligatoire";
                  if (value.length != 9) return "Matriucle incooretce";
                  return null;
                },
                onsaved: (value) {
                  car.setMat = value!;
                },
              ),
              SizedBox(
                height: 14.0,
              ),
              CustomTextWidget(
                label: "Couleur",
                hint: "Donner la couleur la voiture",
                uneIcone: Icons.car_repair,
                typeclavier: TextInputType.text,
                valider: (String? value) {
                  if (value == null || value.length == 0)
                    return "couleur est obligatoire";
                  return null;
                },
                onsaved: (value) {
                  car.setCouleur = value;
                },
              ),
              SizedBox(
                height: 14,
              ),
              CustomRadio(
                titre: "Essence",
                soustitre: "xxxxxx",
                value: 'E',
                groupvalue: radioSelected,
                onchanged: (value) {
                  setState(() {
                    radioSelected = value!;
                  });
                },
              ),
              CustomRadio(
                titre: "Gasoil",
                soustitre: "yyyyyy",
                value: 'G',
                groupvalue: radioSelected,
                onchanged: (value) {
                  setState(() {
                    radioSelected = value!;
                  });
                },
              ),
              Customcheckbox(
                value: valuecheck1,
                text: "Clim Auto",
                soustitre: "Description du ckim auto",
                onchanged: (value) {
                  setState(() {
                    valuecheck1 = value!;
                  });
                },
              ),
              SizedBox(
                height: 14,
              ),
              FormField(
                builder: (state) {
                  return Column(
                    children: [
                      Customcheckbox(
                        value: valuecheck2,
                        text: "CAM De Recule",
                        soustitre: "Description du cam de recul",
                        onchanged: (value) {
                          setState(() {
                            valuecheck2 = value!;
                          });
                        },
                      ),
                      Text(
                        state.errorText ?? '',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  );
                },
                validator: (value) {
                  if (valuecheck1 == false && valuecheck2 == false)
                    return "vosu devez selectionener au moisn une option";
                  return null;
                },
                onSaved: (value) {
                  List<String> op = [];
                  if (valuecheck1 == true) op.add('Clim Auto');
                  if (valuecheck2 == true) op.add('CAM De Recule');
                  car.setOptions = jsonEncode(op);
                },
              ),
              //------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomElevetedB(
                    txtbouton: "Enregister",
                    couleur: Colors.green,
                    onpressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        print(car);
                        DataBaseHelper db = DataBaseHelper.instance;
                        db.add(car);
                      } else {
                        afficherdialog(context);
                        afficherPluginDialog();
                      }
                    },
                  ),
                  CustomElevetedB(
                    txtbouton: "Annuler",
                    couleur: Colors.red,
                    onpressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  afficherdialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            icon: Icon(Icons.error),
            title: Text("Erreur détectée!"),
            content: Text("Veuilllez corriger les erreurs détetcées"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("ok"),
              ),
            ],
          );
        });
  }

  afficherPluginDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      borderSide: const BorderSide(
        color: Colors.red,
        width: 4,
      ),
      width: 480,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      headerAnimationLoop: true,
      animType: AnimType.bottomSlide,
      title: 'Erreur',
      desc: 'Veuillez corriger les erreurs détectées',
      showCloseIcon: true,
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
      btnOkColor: Colors.red,
    ).show();
  }
}
