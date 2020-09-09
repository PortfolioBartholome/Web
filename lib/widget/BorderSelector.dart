import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration myBoxDecoration(Color color) {
  return BoxDecoration(
    border: Border.all(
      width: 5.0, //
      color: color,
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(5.0)
    ),

  );
}
