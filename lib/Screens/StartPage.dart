import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spotify/Screens/signup1.dart';
import 'package:spotify/Utils/assets.dart';
import 'package:spotify/Utils/colors.dart';
import 'package:spotify/Utils/route_name.dart';
import 'package:spotify/Widgets/filledButton.dart';
import 'package:spotify/Widgets/outlinedButton.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: colorPrimary,
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.asset(startImage),
                    Container(
                      color: colorPrimary,
                    )
                  ],
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(spotifyLogo),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * .65),
                        child: const Text(
                          "Millions of Songs. Free on Spotify.",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      filledButton(() {
                        Navigator.pushNamed(context, RouteName.signupScreen);
                      }, context, "Sign up free"),
                      const SizedBox(
                        height: 13,
                      ),
                      outlinedButton(
                          () {}, context, "Continue with Google", googleLogo),
                      const SizedBox(
                        height: 12,
                      ),
                      outlinedButton(() {}, context, "Continue with Facebook",
                          facebookLogo),
                      const SizedBox(
                        height: 12,
                      ),
                      outlinedButton(
                          () {}, context, "Continue with Apple", appleLogo),
                      const SizedBox(
                        height: 12,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RouteName.loginScreen);
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: colorWhite),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
