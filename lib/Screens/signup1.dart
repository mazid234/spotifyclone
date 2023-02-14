import 'package:flutter/material.dart';
import 'package:spotify/Utils/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                  decoration: const BoxDecoration(
                      color: colorBlack, shape: BoxShape.circle),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 14.0, top: 8, right: 8, bottom: 8),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: colorWhite,
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Create account",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: colorWhite,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What’s your email?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: colorWhite,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: colorTextfield,
                ),
                // ignore: prefer_const_constructors
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextField(
                    style: TextStyle(color: colorWhite, fontSize: 18),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterStyle: TextStyle(color: colorWhite)),
                    cursorColor: colorWhite,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorNextButton,
                        shape: const StadiumBorder()),
                    onPressed: () {},
                    child: const Text(
                      "Next",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
