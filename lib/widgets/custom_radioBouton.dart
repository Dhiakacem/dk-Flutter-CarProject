import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final void Function(String?)? onchanged;
  final String value;
  final String groupvalue;
  final String titre;
  final String soustitre;

  const CustomRadio({
    super.key,
    required this.onchanged,
    required this.value,
    required this.groupvalue,
    this.titre = "",
    this.soustitre = "",
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        title: Text(titre),
        subtitle: Text(soustitre),
        value: value,
        groupValue: groupvalue,
        onChanged: onchanged);
  }
}
