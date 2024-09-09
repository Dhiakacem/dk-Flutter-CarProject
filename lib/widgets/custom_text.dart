import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String label, hint;
  final IconData? uneIcone;
  final TextInputType? typeclavier;
  final String? Function(String?)? valider;
  final void Function(String?)? onsaved;
  
  const CustomTextWidget({
    super.key,
    this.label = "",
    this.hint = "",
    this.uneIcone,
    this.typeclavier,
    this.valider,
    this.onsaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 20, color: Colors.blue),
      keyboardType: typeclavier,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(fontSize: 18, color: Colors.green),
        hintText: hint,
        prefixIcon: Icon(uneIcone),
        fillColor: Colors.yellow.withOpacity(0.28),
        filled: true,
        errorStyle: TextStyle(fontSize: 18.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      validator: valider,
      onSaved: onsaved,
    );
  }
}
