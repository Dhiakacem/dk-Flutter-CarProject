import 'package:flutter/material.dart';

class Customcheckbox extends StatelessWidget {
  final void Function(bool?)? onchanged;
  final bool? value;
  final String text, soustitre;
  const Customcheckbox(
      {super.key,
      required this.onchanged,
      this.value,
      this.text = "",
      this.soustitre = ""});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onchanged,
      title: Text(text),
      subtitle: Text(soustitre),
    );
    /*
    return Row(
      children: [
        Checkbox(value: value, onChanged: onchanged),
        Text(text),
      ],
    );*/
  }
}
