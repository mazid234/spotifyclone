import 'package:flutter/material.dart';
import 'package:spotify/Utils/colors.dart';

Widget filledButton(VoidCallback fn, BuildContext context, String text) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        shape: StadiumBorder(), backgroundColor: colorSecondary, elevation: 4),
    onPressed: () {},
    child: Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 46,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: colorBlack, fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
    ),
  );
}
