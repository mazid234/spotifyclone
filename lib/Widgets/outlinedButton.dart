import 'package:flutter/material.dart';
import 'package:spotify/Utils/assets.dart';
import 'package:spotify/Utils/colors.dart';

Widget outlinedButton(
    VoidCallback fn, BuildContext context, String text, String img) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      side: BorderSide(width: 1, color: colorWhite),
      shape: StadiumBorder(),
      backgroundColor: colorPrimary,
      elevation: 4,
    ),
    onPressed: () {},
    child: Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 46,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 20,
              width: 20,
              child: Image.asset(
                img,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                  color: colorWhite, fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    ),
  );
}
