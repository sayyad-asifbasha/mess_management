import 'package:flutter/material.dart';
import 'package:mess_management/services/theme_service.dart';
import 'package:mess_management/services/size_config.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: ThemeService.secondaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.screenHeight * 0.35,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: SizeConfig.screenHeight * 0.1,
                    left: SizeConfig.screenWidth * 0.3,
                    child: CircleAvatar(
                      key: const Key('Profile Pic'),
                      backgroundImage: const NetworkImage(
                          'https://th.bing.com/th/id/OIP.D2Gzy7GXSgpAshfRx9tkHAHaHa?rs=1&pid=ImgDetMain'),
                      radius: SizeConfig.screenHeight * 0.09,
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.screenHeight * 0.28,
                    left: SizeConfig.screenWidth * 0.05,
                    child: const Text(
                      "Mess Management System",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                maximumSize: const Size(300, 200),
                minimumSize: const Size(100, 50),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: ThemeService.primaryTextColor,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.IcreJX7hnOjNYRnlo4DCWwHaE8?rs=1&pid=ImgDetMain'),
                  ),
                  Text(
                    "Continue with Google",
                    style: TextStyle(
                      fontSize: 18,
                      color: ThemeService.primaryTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            Text("Or"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account ? ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ThemeService.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
