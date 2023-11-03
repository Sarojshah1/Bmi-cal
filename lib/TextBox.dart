import 'package:flutter/material.dart';
class Texttox extends StatelessWidget {
  String heighttype;
  final control;
  Texttox({required this.heighttype,required this.control});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: TextField(
        controller: control,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
          suffixText: "$heighttype",
          labelText: "Height in $heighttype"
        ),
      ),
    );
  }
}
