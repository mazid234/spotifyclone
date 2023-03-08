import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Services/auth.dart';
import 'package:spotify/Utils/colors.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? errorMessage = '';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _text(String txt) {
    return Text(
      txt,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: colorWhite,
      ),
    );
  }

  Widget _registerButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: colorNextButton, shape: const StadiumBorder()),
        onPressed: createUserWithEmailAndPassword,
        child: const Text(
          "Register",
          style: TextStyle(fontWeight: FontWeight.w700),
        ));
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : "Humm? $errorMessage",
      style: TextStyle(color: colorWhite),
    );
  }

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
              _text("What’s your email?"),
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
                    controller: _emailController,
                    style: const TextStyle(color: colorWhite, fontSize: 18),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterStyle: TextStyle(color: colorWhite)),
                    cursorColor: colorWhite,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _text("Enter Password"),
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
                    controller: _passController,
                    obscureText: true,
                    style: const TextStyle(color: colorWhite, fontSize: 18),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterStyle: TextStyle(color: colorWhite)),
                    cursorColor: colorWhite,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(child: _registerButton()),
              const SizedBox(
                height: 20,
              ),
              Center(child: _errorMessage())
            ],
          ),
        )
      ]),
    );
  }
}
