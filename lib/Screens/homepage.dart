import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spotify/Services/auth.dart';
import 'package:spotify/Utils/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userId() {
    return Text(
      user?.email ?? 'User Email',
      style: TextStyle(color: colorWhite),
    );
  }

  Widget _signOutButton() {
    return TextButton(
        onPressed: signOut,
        child: const Text(
          "Sign Out",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: colorWhite),
        ));
  }

  Widget _searchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: colorWhite,
      ),
      child: const Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: TextField(
          style: TextStyle(color: colorBlack, fontSize: 18),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              hintText: "Artists, songs, or podcasts",
              hintStyle: TextStyle(fontSize: 15),
              counterStyle: TextStyle(color: colorBlack)),
          cursorColor: colorBlack,
        ),
      ),
    );
  }

  Widget _textWidget(
    String txt,
    double size,
    FontWeight weight,
  ) {
    return Text(
      txt,
      style: TextStyle(fontSize: size, color: colorWhite, fontWeight: weight),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Search",
                    style: TextStyle(
                        color: colorWhite,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: colorWhite,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _searchBar(),
              SizedBox(
                height: 20,
              ),
              _textWidget("Your top genres", 16, FontWeight.w600),

              // _userId(),
              // SizedBox(
              //   height: 20,
              // ),

              // _signOutButton()
            ]),
          ),
        ),
      ),
    );
  }
}
