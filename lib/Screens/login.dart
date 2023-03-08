import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Screens/homepage.dart';
import 'package:spotify/Services/auth.dart';
import 'package:spotify/Utils/colors.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';

  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _loginRegisterButton() {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorNextButton, shape: const StadiumBorder()),
          onPressed: isLogin
              ? signInWithEmailAndPassword
              : createUserWithEmailAndPassword,

          // Navigator.pop(context);

          child: Text(
            isLogin ? "Login" : "Register",
            style: TextStyle(fontWeight: FontWeight.w700),
          )),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : "Humm? $errorMessage",
      style: TextStyle(color: colorWhite),
    );
  }

  Widget _loginOrRegisterButton() {
    return Center(
      child: TextButton(
          onPressed: () {
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: Text(
            isLogin ? "Register Instead" : "Login Instead",
            style: TextStyle(color: colorWhite),
          )),
    );
  }

  Widget _title() {
    return Text(
      isLogin ? "Login" : "Create account",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: colorWhite,
      ),
    );
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: Auth().authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return Column(children: [
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
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: _title()),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
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
                            controller: _controllerEmail,
                            style: TextStyle(color: colorWhite, fontSize: 18),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                counterStyle: TextStyle(color: colorWhite)),
                            cursorColor: colorWhite,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Password",
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
                            obscureText: true,
                            controller: _controllerPassword,
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
                      _loginRegisterButton(),
                      SizedBox(
                        height: 10,
                      ),
                      _loginOrRegisterButton(),
                      SizedBox(
                        height: 20,
                      ),
                      _errorMessage()
                    ],
                  ),
                )
              ]);
            }
          }),
    );
  }
}
