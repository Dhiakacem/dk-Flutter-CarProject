import 'package:flutter/material.dart';

class CustomElevetedB extends StatelessWidget {
  final String txtbouton;
  final Color? couleur;
  final void Function()? onpressed;
  const CustomElevetedB(
      {super.key, this.txtbouton = "", this.couleur, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(couleur)),
      onPressed: onpressed,
      child: Text(
        txtbouton,
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }
}
